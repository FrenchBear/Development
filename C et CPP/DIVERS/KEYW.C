
int main()
{         
  int i;
  goto public;   
  
  virtual:
    i++;
    goto try;

  private:
    i++;
    goto protected;        
    
  friend:       
    i++;
    goto inline;
        
  public:
    i = 0;   
    goto private;
  
  this:
    i++;
    goto virtual;
    
  delete:
    i++;
    goto friend;
    
  inline:
    i++;
    goto this;
    
  class:
    i++;
    goto template;
    
  protected:
    i++;
    goto class;
    
  new:
    i++;
    goto delete;
  
  template:   
    i++;
    goto new;
  
  try:
    return i;
}