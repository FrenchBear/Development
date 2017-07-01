// NativeMethods class
// Regroup P/Invoke declarations, to follow code analysis recommendations
// 2016-11-12   PV

using System;
using System.Runtime.InteropServices;


namespace FileFilter
{
    internal static class NativeMethods
    {
        [DllImport("shlwapi.dll", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern int StrCmpLogicalW(String x, String y);


        // Win32 API for menus
        [DllImport("user32.dll")]
        public static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);

        [DllImport("user32.dll", CharSet =CharSet.Unicode)]
        public static extern bool InsertMenu(IntPtr hMenu, Int32 wPosition, Int32 wFlags, IntPtr wIDNewItem, string lpNewItem);

    }
}
