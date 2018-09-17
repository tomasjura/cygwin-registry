using System;
using System.Runtime.InteropServices;
/*
There are several distinct approaches to do a file association refresh. Who knows which one is correct?

https://stackoverflow.com/questions/17503289/how-to-refresh-reload-desktop

SHChangeNotify https://msdn.microsoft.com/en-us/library/bb762118(v=vs.85).aspx

# https://social.msdn.microsoft.com/Forums/vstudio/en-US/826fef09-8361-4bb6-b0db-33f8a24fb2bb/how-can-i-force-a-registry-change-to-be-recognized-by-the-system?forum=csharpgeneral
# or logout & login

*/

internal static class SafeNativeMethods
{
    public static IntPtr HWND_BROADCAST = (IntPtr)0xffff;
    public const int WM_WININICHANGE = 0x001A;

    public static long SHCNE_ASSOCCHANGED = 0x08000000L;
    public static uint SHCNF_IDLIST = 0;

    [DllImport ("User32.dll")]
    public static extern bool PostMessage (IntPtr hWnd, int Msg, int wParam, int lParam);
    [DllImport ("Shell32.dll")]
    public static extern void SHChangeNotify (long wEventId, uint uFlags, IntPtr dwItem1, IntPtr dwItem2);
    /*
    public static extern int SendMessageTimeout(
                                                IntPtr hWnd,
                                                [MarshalAs(UnmanagedType.U4)] int Msg,
                                                IntPtr wParam,
                                                IntPtr lParam,
                                                [MarshalAs(UnmanagedType.U4)] int fuFlags,
                                                [MarshalAs(UnmanagedType.U4)] int uTimeout,
                                                [MarshalAs(UnmanagedType.U4)] ref int lpdwResult);
                                                */
}

public static class NotifyApps
{
   public static void Main ()
   {
      SafeNativeMethods.PostMessage (SafeNativeMethods.HWND_BROADCAST, SafeNativeMethods.WM_WININICHANGE, 0, 5000);
//      SafeNativeMethods.SendMessageTimeout(SafeNativeMethods.HWND_BROADCAST,SafeNativeMethods.WM_WININICHANGE,0,0,0,5000);
      SafeNativeMethods.SHChangeNotify( SafeNativeMethods.SHCNE_ASSOCCHANGED, SafeNativeMethods.SHCNF_IDLIST , IntPtr.Zero, IntPtr.Zero );
   }
}
