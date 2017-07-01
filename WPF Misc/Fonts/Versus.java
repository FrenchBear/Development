/*
 * Alec Jacobson
 * 
 */
import java.awt.*;
import java.util.LinkedList;

class DropDown{
  Color outline_color = Color.BLACK;
  Color foreground = Color.BLACK;
  Color background = Color.WHITE;
  DropDownItem items[];
  int x, y, width, height;
  boolean is_selected = false;
  int selected_index;
  public DropDown(int num_items){
    items = new DropDownItem[num_items];
  }
}

class DropDownItem{
  Color outline_color = Color.WHITE;
  Color foreground = Color.BLACK;
  Color background = Color.WHITE;
  String text;
  boolean is_selected = false;
  public DropDownItem(String text){
    this.text = text;
  }
  public DropDownItem(
    String text, 
    Color outline_color, 
    Color foreground, 
    Color background)
  {
    this.text = text;
    this.outline_color = outline_color;
    this.foreground = foreground;
    this.background = background;
  }
}

class Slider{
  static final int RADIUS = 10;
  int x,y,width,height;
  double f = 0.5;
  Color color = Color.GREEN;
  boolean is_selected = false;
  public Slider(Color color){
    this.color = color;
  }

  public Slider(Color color, int x, int y, int width, int height){
    this.color = color;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
}

class Button{
  static final int WIDTH = 100;
  static final int HEIGHT= 20;
  int x,y;
  Color background = Color.WHITE; 
  Color foreground = Color.BLACK; 
  boolean is_selected = false;
  String text = "button";
  int click_count = 0;
  public Button(String text){
    this.text = text;
  }
  
  public Button(String text, int x, int y){
    this.text = text;
    this.x = x;
    this.y = y;
  }
  public Button(String text, int x, int y, Color foreground, Color background){
    this.text = text;
    this.x = x;
    this.y = y;
    this.foreground = foreground;
    this.background = background;
  }
}

/**
 *
 * @author ajx
 */
public class Versus extends BufferedApplet{

  int w, h;//bounds of applet
  int bottom_x=0;
  int bottom_y=0;
  int top_x=0;
  int top_y=0;
  int old_bottom_x=0;
  int old_bottom_y=0;
  int old_top_x=0;
  int old_top_y=0;
  int bottom_handle_x=0;
  int bottom_handle_y=0;
  int top_handle_x=0;
  int top_handle_y=0;
  int mx = 0;
  int my = 0;
  int size1= 128;
  int size2= 128;
  final Font menu_font  = new Font("SansSerif", Font.PLAIN, 12);
  long last_type = 0;
  float alpha = 0.3f;
  boolean initialized = false;
  boolean fitted = false;
  Choice FontChooser1 = new Choice();
  Choice FontChooser2 = new Choice();
  TextField text_field = new TextField("Rr    ");
  Button size1_button;
  Button size2_button;
  Button grid_button; 
  Button link_button; 
  Button reset_button; 
  Button key_button; 
  Slider slider1;
  Slider slider2;
  Slider stationary_slider;
  boolean grid_on = false;
  boolean dragging1 = false;
  boolean dragging2 = false;
  final int HANDLE_DIAMETER = 20;
  Color color1;
  Color color2;
  Button down_button = null;
  boolean shift_down = false;
  DropDown color_chooser1;
  DropDown color_chooser2;
  final Color[] COLORS = new Color[] {
    Color.BLACK, Color.WHITE, Color.PINK, Color.MAGENTA, 
    Color.RED, Color.ORANGE, Color.YELLOW, Color.GREEN, Color.CYAN, Color.BLUE
    };

  
  //Label label = new Label("versus");
  public void initialize() {
    Font[] fonts = 
      GraphicsEnvironment.getLocalGraphicsEnvironment().getAllFonts();
    for(int i=0;i<fonts.length;i++){
      FontChooser1.add(fonts[i].getName());
      FontChooser2.add(fonts[i].getName());
    }
    add(FontChooser1);
    add(text_field);
    add(FontChooser2);
    // choose two default fonts that definitely exist
    FontChooser1.select("Serif");
    FontChooser2.select("SansSerif");
    size1_button = new Button("600pt");
    size2_button = new Button("600pt");
    slider1 = new Slider(Color.BLUE); 
    slider2 = new Slider(Color.RED); 
    stationary_slider = slider1;
    grid_button = new Button("Graph Paper");
    link_button = new Button("Link sizes");
    key_button = new Button("Type freely");
    reset_button = new Button("Reset");
    color_chooser1 = new DropDown(COLORS.length);
    color_chooser2 = new DropDown(COLORS.length);
    for(int i=0; i<COLORS.length;i++){
      color_chooser1.items[i] = 
        new DropDownItem("", Color.WHITE, Color.BLACK, COLORS[i]);
      color_chooser2.items[i] = 
        new DropDownItem("", Color.WHITE, Color.BLACK, COLORS[i]);
      // DEFAULT COLOR CHOICES
      if(COLORS[i] == Color.RED)
        color_chooser2.selected_index = i;
      if(COLORS[i] == Color.BLUE)
        color_chooser1.selected_index = i;
    }
    setSize(bounds().width+1,bounds().height+1);
    repaint();
    setSize(bounds().width,bounds().height);
  //  for (int i = 0; i < 4; i++)
  //    c.addItem(""+i);
  //  add(c);
    initialized = true;
  }

  public void render(Graphics g) {
    if(!initialized)
      initialize();
    if (true||w == 0||reset_button.is_selected) {//true here for resizing appletviewer
      if(w!=bounds().width||h!=bounds().height||reset_button.is_selected){
        w = bounds().width;
        h = bounds().height;
        top_x = (int)(w*0.05+HANDLE_DIAMETER);
        top_y = (int)(h*0.5+size1*0.5);
        bottom_x = (int)(w*0.01+HANDLE_DIAMETER);
        bottom_y = (int)(h*0.5+size1*0.5);
        slider1.f = 0.5;
        slider2.f = 0.5;
        /**
        FontChooser1.select("Serif");
        FontChooser2.select("SansSerif");
        for(int i=0; i<COLORS.length;i++){
          // DEFAULT COLOR CHOICES
          if(COLORS[i] == Color.RED)
            color_chooser2.selected_index = i;
          if(COLORS[i] == Color.BLUE)
            color_chooser1.selected_index = i;
        }
        */
        reset_button.is_selected = false;
      }
    }
    clear(g);
    color1 = color_chooser1.background;
    color2 = color_chooser2.background;
    // DRAW MENU ITEMS
    text_field.setLocation(w/2-text_field.getWidth()/2,2);
    color_chooser1.height= FontChooser1.getHeight()-2*2;
    color_chooser1.width = color_chooser1.height;
    color_chooser1.x = text_field.getLocation().x-color_chooser1.width-2;
    color_chooser1.y = 2;
    FontChooser1.setSize(color_chooser1.x-2-0,FontChooser1.getHeight());
    FontChooser1.setLocation(0,0);
    color_chooser2.height = FontChooser2.getHeight()-2*2; 
    color_chooser2.width = color_chooser2.height;
    color_chooser2.x = text_field.getLocation().x+text_field.getWidth()+2;
    color_chooser2.y = 2;
    FontChooser2.setSize(
      w-(color_chooser2.x+color_chooser2.width)-2,
      FontChooser2.getHeight());
    FontChooser2.setLocation(w-FontChooser2.getWidth(),0);
    
    int second_row_y = FontChooser1.getLocation().y+ 
      Math.max(FontChooser1.getHeight(),text_field.getHeight())+2;
    size1_button.x = w/2-Button.WIDTH;
    size1_button.y = second_row_y;
    size2_button.x = size1_button.x+Button.WIDTH+5;
    size2_button.y = second_row_y;
    if(size1_button.is_selected)
      size1_button.text = ""+(int)(100*slider1.f/slider2.f+0.5)+"% of right"; 
    else
      size1_button.text = ""+(int)(slider1.f*h)+"pt"; 
    if(size2_button.is_selected)
      size2_button.text = ""+(int)(100*slider2.f/slider1.f+0.5)+"% of left"; 
    else
      size2_button.text = ""+(int)(slider2.f*h)+"pt"; 
    slider1.x = 0;
    slider1.y = second_row_y; 
    slider1.width = size1_button.x-slider1.x-5; 
    slider1.height =  20;
    slider2.x = size2_button.x+Button.WIDTH+5; 
    slider2.y = second_row_y;
    slider2.width = w-slider2.x;
    slider2.height = 20;
    slider1.color = color1;
    slider2.color = color2;
    update_dropdown(color_chooser1);
    update_dropdown(color_chooser2);
    update_slider(slider1);
    update_slider(slider2);
    grid_button.x = w-Button.WIDTH-5;
    grid_button.y = slider2.y+slider2.height+5;
    link_button.x = w-Button.WIDTH-5;
    link_button.y = slider2.y+slider2.height+1*(Button.HEIGHT+5)+5;
    key_button.x = w-Button.WIDTH-5;
    key_button.y = slider2.y+slider2.height+2*(Button.HEIGHT+5)+5;
    reset_button.x = w-Button.WIDTH-5;
    reset_button.y = slider2.y+slider2.height+3*(Button.HEIGHT+5)+5;
    if(grid_button.is_selected)
      graph_paper(g);
    if(grid_button.is_selected){
      draw_guide(g, color1, bottom_x, bottom_y);
      draw_guide(g, color2 , top_x, top_y);
    }
    if(shift_down){
      if(dragging1)
        draw_guide(g, color1, old_bottom_x, old_bottom_y);
      if(dragging2)
        draw_guide(g, color2, old_top_x, old_top_y);
    } 

    Graphics2D g2 = (Graphics2D) g;
    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
      RenderingHints.VALUE_ANTIALIAS_ON);

    // DRAW BOTTOM
    Font f1 = new Font(FontChooser1.getSelectedItem(), Font.PLAIN, (int)(slider1.f*h));
    g2.setFont(f1);
    g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER,
        alpha));
    g2.setColor(color1);
    //g2.fillRect(0,FontChooser1.getLocation().y-1,FontChooser1.getLocation().x-1,
    //  FontChooser1.getHeight()+1);
    if(dragging1){
      bottom_x = mx+HANDLE_DIAMETER/2;
      bottom_y = my-HANDLE_DIAMETER/2;
      if(shift_down){
        if(Math.abs(bottom_x-old_bottom_x)>Math.abs(bottom_y-old_bottom_y))
          bottom_y = old_bottom_y;
        else
          bottom_x = old_bottom_x;
      }
    }
    bottom_handle_x = bottom_x-HANDLE_DIAMETER;
    bottom_handle_y = bottom_y;
    g2.drawString(text_field.getText(), bottom_x, bottom_y);
    g2.setColor(Color.WHITE);
    if(dragging1) g2.setColor(Color.BLACK);
    g2.fillOval(bottom_handle_x,bottom_handle_y,HANDLE_DIAMETER,HANDLE_DIAMETER);
    g2.setColor(color1);
    g2.drawOval(bottom_handle_x,bottom_handle_y,HANDLE_DIAMETER,HANDLE_DIAMETER);

    //DRAW TOP
    Font f2 = new Font(FontChooser2.getSelectedItem(), Font.PLAIN, (int)(slider2.f*h));
    g2.setFont(f2);
    g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER,
        alpha));
    g2.setColor(color2);
    //g2.fillRect(FontChooser2.getLocation().x+FontChooser2.getWidth()+1,FontChooser2.getLocation().y-1,
    //  w,FontChooser2.getHeight()+1);
    if(dragging2){
      top_x = mx+HANDLE_DIAMETER/2;
      top_y = my-HANDLE_DIAMETER/2;
      if(shift_down){
        if(Math.abs(top_x-old_top_x)>Math.abs(top_y-old_top_y))
          top_y = old_top_y;
        else
          top_x = old_top_x;
      }
    }
    top_handle_x = top_x-HANDLE_DIAMETER;
    top_handle_y = top_y;
    g2.drawString(text_field.getText(), top_x, top_y);
    g2.setColor(Color.WHITE);
    if(dragging2) g2.setColor(Color.BLACK);
    g2.fillOval(top_handle_x,top_handle_y,HANDLE_DIAMETER,HANDLE_DIAMETER);
    g2.setColor(color2);
    g2.drawOval(top_handle_x,top_handle_y,HANDLE_DIAMETER,HANDLE_DIAMETER);

    //DRAW MENU ITEMS
    g2.setFont(menu_font);
    draw_slider(g2,slider1);
    draw_slider(g2,slider2);
    draw_button(g2,size1_button);
    draw_button(g2,size2_button);
    draw_button(g2,grid_button);
    draw_button(g2,link_button);
    draw_button(g2,key_button);
    draw_button(g2,reset_button);
    draw_dropdown(g2,color_chooser1);
    draw_dropdown(g2,color_chooser2);
    FontChooser1.repaint();
    //label.repaint();
    FontChooser2.repaint();
    
    animating = true;
  }
  



  
  public boolean keyUp(Event e, int key) {
    if(!key_button.is_selected) return false;
    else{
    /**switch(key){
      case Event.DOWN:
        slider1.f *= 0.5;
        slider1.f = slider1.f<1 ? 1 : slider1.f;
        slider2.f *= 0.5;
        slider2.f = slider2.f<1 ? 1 : slider2.f;
        break;
      case Event.UP:
        slider1.f *= 2.0;
        slider2.f *= 2.0;
        break;
      case Event.RIGHT:
        slider2.f *= 1.1;
        break;
      case Event.LEFT:
        slider2.f /= 1.01;
        slider2.f = slider2.f<1 ? 1 : slider2.f;
        break;
      default:
    */  
        if(text_field.hasFocus()){
          //do nothing...text_field will take care of things on her own
        }else if(System.currentTimeMillis()-last_type<2000){
          text_field.setText(text_field.getText() + (char)key);
        }else{
          text_field.setText(""+(char)key);
        }
        // toggle grid background
        if(text_field.getText().toLowerCase().equals("grid"))
          grid_button.is_selected = !grid_button.is_selected;
        // select two fonts at random
        if(text_field.getText().toLowerCase().equals("random")){
          FontChooser1.select((int)(Math.random()*FontChooser1.getItemCount()));
          FontChooser2.select((int)(Math.random()*FontChooser2.getItemCount()));
        }
        if(text_field.getText().toLowerCase().equals("reset"))
          reset_button.is_selected = !reset_button.is_selected;
        //switch bottom and top fonts
        if(text_field.getText().toLowerCase().equals("switch")){
          String temp = FontChooser1.getSelectedItem();
          FontChooser1.select(FontChooser2.getSelectedItem());
          FontChooser2.select(temp);
        }
    }
    

    last_type = System.currentTimeMillis();
    return damage = true;
  }

  
  public boolean mouseDown(Event e, int x, int y) {
    mx = x;
    my = y;
    damage = true;
    // actions in priority
    // grabbing top's handle
    if(isInRectCircle(mx,my,top_handle_x,top_handle_y,HANDLE_DIAMETER)){
      stationary_slider = slider1;
      dragging2 = true;
      old_top_x = top_x;
      old_top_y = top_y;
    // grabbing bottom's handle
    }else if(isInRectCircle(mx,my,bottom_handle_x,bottom_handle_y,HANDLE_DIAMETER))
    {
      stationary_slider = slider2;
      dragging1 = true;
      old_bottom_x = bottom_x;
      old_bottom_y = bottom_y;
    }else if(
      isInRect(
        mx,my,
        color_chooser2.x,color_chooser2.y,
        color_chooser2.width, color_chooser2.height))
    {
      color_chooser2.is_selected = true;
    }else if(
      isInRect(
        mx,my,
        color_chooser1.x,color_chooser1.y,
        color_chooser1.width, color_chooser1.height))
    {
      color_chooser1.is_selected = true;
    }else if(
      isInRect(mx,my,size1_button.x,size1_button.y,Button.WIDTH,Button.HEIGHT))
    {
      size1_button.click_count = 0;
      size1_button.is_selected = !size1_button.is_selected;
    }else if(
      isInRect(mx,my,size2_button.x,size2_button.y,Button.WIDTH,Button.HEIGHT))
    {
      size2_button.click_count = 0;
      size2_button.is_selected = !size2_button.is_selected;
    }else if(
      isInRect(mx,my,grid_button.x,grid_button.y,Button.WIDTH,Button.HEIGHT))
    {
      grid_button.click_count = 0;
      grid_button.is_selected = !grid_button.is_selected;
    }else if(
      isInRect(mx,my,link_button.x,link_button.y,Button.WIDTH,Button.HEIGHT))
    {
      link_button.click_count = 0;
      link_button.is_selected = !link_button.is_selected;
    }else if(
      isInRect(mx,my,key_button.x,key_button.y,Button.WIDTH,Button.HEIGHT))
    {
      key_button.click_count = 0;
      key_button.is_selected = !key_button.is_selected;
    }else if(
      isInRect(mx,my,reset_button.x,reset_button.y,Button.WIDTH,Button.HEIGHT))
    {
      reset_button.click_count = 2;
      reset_button.is_selected = !reset_button.is_selected;
    }else if(isInRectCircle(mx,my,slider1.x+(int)(slider1.f*slider1.width)-Slider.RADIUS,slider1.y,Slider.RADIUS*2)){
      slider1.is_selected = true;
    }else if(isInRectCircle(mx,my,slider2.x+(int)(slider2.f*slider2.width)-Slider.RADIUS,slider2.y,Slider.RADIUS*2)){
      slider2.is_selected = true;
    }else if(isInRect(mx,my,slider1.x,slider1.y,slider1.width,slider1.height)){
      slider1.is_selected = true;
    }else if(isInRect(mx,my,slider2.x,slider2.y,slider2.width,slider2.height)){
      slider2.is_selected = true;
    }
    return true;
  }  

  public boolean isInRect(int x, int y, int rx, int ry, int w, int h){
    return (x>rx&&y>ry&&x<rx+w&&y<ry+h);
  }
  public boolean isInRectCircle(int x, int y, int rx, int ry, int d){
    return isInCircle(x,y,rx+d/2,ry+d/2,d/2);
  }
  
  public boolean isInCircle(int x, int y, int cx, int cy, int r){
    return ((x-cx)*(x-cx)+(y-cy)*(y-cy)<r*r);
  }
  
  public boolean mouseUp(Event e, int x, int y) {
    mx = x;
    my = y;
    damage = true;
    slider1.is_selected = false;
    color_chooser1.is_selected = false;
    color_chooser2.is_selected = false;
    slider2.is_selected = false;
    dragging1 = false;
    dragging2 = false;
    return true;
  }  
  
  public boolean mouseDrag(Event e, int x, int y) {
    shift_down = e.shiftDown();
    mx = x;
    my = y;
    damage = true;
    return true;
  }  
  
  /**
  * This method will clear the graphic before drawing anotherString
  */
  public void clear(Graphics g){
    Dimension d = getSize();
    Color c = getBackground();
    g.setColor(c);
    g.fillRect(0,0,d.width,d.height);
    //g.fillRect(0,FontChooser1.getLocation().y+FontChooser1.getHeight()+1,d.width,d.height);
/**    g.fillRect(0,FontChooser1.getLocation().y-1,FontChooser1.getLocation().x-1,
      FontChooser1.getHeight()+1);
    g.fillRect(FontChooser2.getLocation().x+FontChooser2.getWidth()+1,FontChooser2.getLocation().y-1,
      w,FontChooser2.getHeight()+1);*/
    repaint();
  }

  public void draw_guide(Graphics g, Color c, int x, int y){
    g.setColor(c);
    g.drawLine(0,y,w,y);
    g.drawLine(x,0,x,h);
  }
  // throw up a grid in the background guide lines on the fonts
  public void graph_paper(Graphics g){
    g.drawLine(top_x,0,top_x,h);
    g.setColor(Color.GREEN);
    //too prevent non-sense grids
    int grid_step = (int)(stationary_slider.f*h)/10>2 ? (int)(stationary_slider.f*h)/10 : 2;
    int y = 0;
    while(y<h){
      g.drawLine(0,y,w,y);
      y+= grid_step;
    }
    y = 0;
    while(y>0){
      g.drawLine(0,y,w,y);
      y-= grid_step;
    }
    int x = 0;
    while(x<w){
      g.drawLine(x,0,x,h);
      x+= grid_step;
    }
    x = 0;
    while(x>0){
      g.drawLine(x,0,x,h);
      x-= grid_step;
    }

  }

  public void draw_button(Graphics2D g2, Button b){
    // get correct backgroun and foreground colors
    Color background = null;
    Color foreground= null;
    if(b.is_selected||b.click_count>0){
      background = b.foreground;
      foreground = b.background;
      b.click_count= b.click_count<=1 ? 0 : b.click_count-1;
    }else{
      foreground= b.foreground;
      background = b.background;
    }
    // don't draw if not on screen
    if(b.y+Button.HEIGHT>h||b.y<0) return;
    if(b.x+Button.WIDTH>w||b.x<0) return;
    g2.setColor(background);
    g2.fillRect(b.x,b.y,Button.WIDTH,Button.HEIGHT);
    g2.setColor(foreground);
    g2.drawRect(b.x,b.y,Button.WIDTH,Button.HEIGHT);
    g2.drawString(b.text,b.x+4,b.y+Button.HEIGHT-4); 
  }

  public void draw_slider(Graphics2D g2, Slider s){
    g2.setColor(s.color);
    g2.fillRect(s.x,s.y,s.width,s.height);
    g2.setColor(Color.WHITE);
    if(s.is_selected||
      ((slider1.is_selected||slider2.is_selected)&&link_button.is_selected)) 
      g2.setColor(Color.BLACK);
    g2.fillOval(s.x+(int)(s.f*s.width)-Slider.RADIUS,
      s.y+s.height/2-Slider.RADIUS,Slider.RADIUS*2,Slider.RADIUS*2);
    g2.setColor(Color.BLACK);
    if(s.is_selected||
      ((slider1.is_selected||slider2.is_selected)&&link_button.is_selected)) 
      g2.setColor(Color.WHITE);
    g2.drawOval(s.x+(int)(s.f*s.width)-Slider.RADIUS,
      s.y+s.height/2-Slider.RADIUS,Slider.RADIUS*2,Slider.RADIUS*2);
  }
  public void update_slider(Slider s){
    if(s.is_selected){
      s.f = (double)(mx-s.x)/(double)(s.width);
      s.f = s.f>1 ? 1.0 : s.f;
      s.f = s.f<0 ? 0.0 : s.f;
    }else if(slider1.is_selected&&link_button.is_selected){
      s.f = slider1.f;
    }else if(slider2.is_selected&&link_button.is_selected){
      s.f = slider2.f;
    }
  }
  public void update_dropdown(DropDown d){
    if(d.is_selected){
      for(int i=0;i<d.items.length;i++){
        if(
          isInRect(mx,my,d.x,
            (1+i)*d.height+d.y,
            d.width,d.height)
          )
        {
          d.selected_index = i;
          d.items[i].is_selected = true;
        }else
          d.items[i].is_selected = i==d.selected_index;
      }
    }
    d.background = d.items[d.selected_index].background;
  }
  
  public void draw_dropdown(Graphics2D g2, DropDown d){
    if(d.is_selected){
     g2.setColor(d.background); 
     g2.fillRect(d.x,d.y,d.width,d.height);
     g2.setColor(d.outline_color);
     g2.drawRect(d.x,d.y,d.width,d.height);
     for(int i=0;i<d.items.length;i++){
       g2.setColor(d.items[i].background);
       g2.fillRect(d.x,d.y+(i+1)*d.height,d.width,d.height);
       if(d.items[i].is_selected){
         g2.setColor(Color.BLACK);
         g2.drawRect(d.x,d.y+(i+1)*d.height,d.width,d.height);
       }else{
         g2.setColor(d.items[i].outline_color);
       }
     }
     g2.setColor(d.outline_color);
     g2.drawRect(d.x,d.y+d.height,
       d.width,d.height*d.items.length);
    }else{
     g2.setColor(d.background); 
     g2.fillRect(d.x,d.y,d.width,d.height);
     g2.setColor(d.outline_color);
     g2.drawRect(d.x,d.y,d.width,d.height);
    }
  }
}
