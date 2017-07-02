using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;


namespace WindowsApplication1
{

    public class MonTabControl : TabControl
    {
        private bool m_simpleMode = false;
        private bool m_simpleModeInDesign = false;
        protected override bool IsInputKey(System.Windows.Forms.Keys keys)
        {
            if (keys == Keys.Up) return false;
            if (keys == Keys.Down) return false;
            if (keys == Keys.Left) return false;
            if (keys == Keys.Right) return false;
            return true;
        }
        [DefaultValue(false)]
        public bool SimpleMode
        {
            get { return m_simpleMode; }
            set
            {
                m_simpleMode = value;
                RecreateHandle();
            }
        }
        [DefaultValue(false)]
        public bool SimpleModeInDesign
        {
            get { return m_simpleModeInDesign; }
            set
            {
                m_simpleModeInDesign = value;
                RecreateHandle();
            }
        }
        public override Rectangle DisplayRectangle
        {
            get
            {
                if ((m_simpleMode == true) && (!DesignMode || m_simpleModeInDesign))
                {
                    return new Rectangle(0, 0 /*10*/, base.Width, base.Height/*-10*/);
                }
                else
                    return base.DisplayRectangle;
            }
        }
    }

}
