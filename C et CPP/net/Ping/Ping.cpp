// Ping.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
//int _tmain(int argc, _TCHAR* argv[])

#include <winsock.h>
#include <windowsx.h>
#include "icmpdefs.h"

int doit(int argc, char* argv[])
{
    // Check for correct command-line args
    if (argc < 2) {
        cerr << "usage: ping <host>" << endl;
        return 1;
    }
    
    // Load the ICMP.DLL
    HINSTANCE hIcmp = LoadLibrary("ICMP.DLL");
    if (hIcmp == 0) {
        cerr << "Unable to locate ICMP.DLL!" << endl;
        return 2;
    }

    // Look up an IP address for the given host name
    struct hostent* phe;
    if ((phe = gethostbyname(argv[1])) == 0) {
        cerr << "Could not find IP address for " << argv[1] << endl;
        return 3;
    }

    // Get handles to the functions inside ICMP.DLL that we'll need
    typedef HANDLE (WINAPI* pfnHV)(VOID);
    typedef BOOL (WINAPI* pfnBH)(HANDLE);
    typedef DWORD (WINAPI* pfnDHDPWPipPDD)(HANDLE, DWORD, LPVOID, WORD,
            PIP_OPTION_INFORMATION, LPVOID, DWORD, DWORD); // evil, no?
    pfnHV pIcmpCreateFile;
    pfnBH pIcmpCloseHandle;
    pfnDHDPWPipPDD pIcmpSendEcho;
    pIcmpCreateFile = (pfnHV)GetProcAddress(hIcmp,
            "IcmpCreateFile");
    pIcmpCloseHandle = (pfnBH)GetProcAddress(hIcmp,
            "IcmpCloseHandle");
    pIcmpSendEcho = (pfnDHDPWPipPDD)GetProcAddress(hIcmp,
            "IcmpSendEcho");
    if ((pIcmpCreateFile == 0) || (pIcmpCloseHandle == 0) || 
            (pIcmpSendEcho == 0)) {
        cerr << "Failed to get proc addr for function." << endl;
        return 4;
    }

    // Open the ping service
    HANDLE hIP = pIcmpCreateFile();
    if (hIP == INVALID_HANDLE_VALUE) {
        cerr << "Unable to open ping service." << endl;
        return 5;
    }
   
    // Build ping packet
    char acPingBuffer[64];
    memset(acPingBuffer, '\xAA', sizeof(acPingBuffer));
    PIP_ECHO_REPLY pIpe = (PIP_ECHO_REPLY)GlobalAlloc(
            GMEM_FIXED | GMEM_ZEROINIT,
            sizeof(IP_ECHO_REPLY) + sizeof(acPingBuffer));
    if (pIpe == 0) {
        cerr << "Failed to allocate global ping packet buffer." << endl;
        return 6;
    }
    pIpe->Data = acPingBuffer;
    pIpe->DataSize = sizeof(acPingBuffer);      

    // Send the ping packet
    DWORD dwStatus = pIcmpSendEcho(hIP, *((DWORD*)phe->h_addr_list[0]), 
            acPingBuffer, sizeof(acPingBuffer), NULL, pIpe, 
            sizeof(IP_ECHO_REPLY) + sizeof(acPingBuffer), 5000);
    if (dwStatus != 0) {
        cout << "Addr: " <<
                int(LOBYTE(LOWORD(pIpe->Address))) << "." <<
                int(HIBYTE(LOWORD(pIpe->Address))) << "." <<
                int(LOBYTE(HIWORD(pIpe->Address))) << "." <<
                int(HIBYTE(HIWORD(pIpe->Address))) << ", " <<
                "RTT: " << int(pIpe->RoundTripTime) << "ms, " <<
                "TTL: " << int(pIpe->Options.Ttl) << endl;
    }
    else {
        cerr << "Error obtaining info from ping packet." << endl;
    }

    // Shut down...
    GlobalFree(pIpe);
    FreeLibrary(hIcmp);
    return 0;
}

int main(int argc, char* argv[])
{
    WSAData wsaData;
    if (WSAStartup(MAKEWORD(1, 1), &wsaData) != 0) {
        return 255;
    }

    int retval = doit(argc, argv);

    WSACleanup();
    return retval;
}
