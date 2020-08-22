module Characters;

import std.stdio;

int main()
{
    string s1 = "Aé♫山𝄞🐗";
    writeln(s1);
    writeln("s1.l=", s1.length);
    foreach (char c; s1) {
        printf("%02x ", ubyte(c));
    }
    writeln('\n');

    wstring s2 = "Aé♫山𝄞🐗";
    writeln(s2);
    writeln("s2.l=", s2.length);
    foreach (wchar c; s1) {
        printf("%04x ", ushort(c));
    }
    writeln('\n');

    dstring s3 = "Aé♫山𝄞🐗";
    writeln(s3);
    writeln("s3.l=", s3.length);
    foreach (dchar c; s1) {
        printf("%08x ", uint(c));
    }
    writeln('\n');

    //char cend;
    //write("(Pause)");
    //readf("%c", &cend);
    return 0;
}
