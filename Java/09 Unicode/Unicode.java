
// Unicode exercices in Java
// 2018-08-20 PV

import java.io.*;
import java.text.Normalizer;
import java.util.List;
import java.util.Arrays;

class Unicode {
    public static void main(String[] args) throws Exception {
        /*
        // Switch out to UTF-8, but this doesn't change the console
        try {
            System.setOut(new PrintStream(new FileOutputStream(FileDescriptor.out), true, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new InternalError("VM does not support mandatory encoding UTF-8");
        }

        // switch console to UTF-8
        try {
            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", "chcp", "65001").inheritIO();
            Process p = pb.start();
            p.waitFor();
        } catch (Throwable t) {
            t.printStackTrace();
        }
        */

        System.setOut(new PrintStream(new FileOutputStream(FileDescriptor.out), true, "UTF-8"));
        ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", "chcp", "65001").inheritIO();
        Process p = pb.start();
        p.waitFor();

        // Unicode encodings
        // A Latin Capital Letter A, U+0041, UTF-8: 0x41, UTF-16: 0x0041, UTF-32:
        // 0x00000041
        // é Latin Small Letter E with Acute, U+00E9, UTF-8: 0xC3 0xA9, UTF-16: 0x00E9, 
        // TF-32: 0x000000E9.  ecomposition: U+0301-U+0065.  ppercase: É U+00C9
        // ♫ Beamed eighth notes, U+266B, UTF-8: 0xE2 0x99 0xAB, UTF-16: 0x266B, U
        // F-32: 0x0000266B
        // 𝄞 Musical symbol G clef, U+1D11E, UTF-8: 0xF0 0x9D 0x84 0x9E, UTF-16: 0
        // D834 0xDD1E, UTF-32: 0x0001D11E

        System.out.println("Unicode Encodings");

        final String s = "Aé♫𝄞";
        // In Java, length = the number of Unicode code units (java chars) in the string
        System.out.println(s);
        System.out.printf("char (UTF-16)       len=%2d ", s.length());

        // Iterate over chars -> two surrogate chars for G clef in plane 1
        for (int c : s.chars().toArray())
            System.out.printf("%04x ", c);
        System.out.println();

        System.out.printf("codepoints (UTF-32) len=%2d ", s.codePointCount(0, s.length()));
        // Iterate over codepoints -> 4 codepoints in total
        for (int c : s.codePoints().toArray())
            System.out.printf("%04x ", c);
        System.out.println();

        byte[] b8 = s.getBytes("UTF-8");
        System.out.printf("UTF-8               len=%2d ", b8.length);
        for(byte b: b8)
            System.out.printf("%02x ", b);
        System.out.println();

        // Normalization of composition/decomposition of accents
        System.out.println("\nUnicode composition/decomposition");
        final String s1 = "à";     // Not normalized
        final String s2 = "à";     // Normalized
        System.out.printf("s1: %s, len(s1): %d\n", s1, s1.length());
        System.out.printf("s2: %s, len(s2): %s\n", s2, s2.length());
        System.out.printf("s1.equals(s2): %b\n", s1.equals(s2));
        System.out.printf("s1.equals(s2) after NFC normalization:  %b\n",
                Normalizer.normalize(s1, Normalizer.Form.NFC).equals(Normalizer.normalize(s2, Normalizer.Form.NFC)));
        System.out.printf("s1.equals(s2) after NFKC normalization: %b\n",
                Normalizer.normalize(s1, Normalizer.Form.NFKC).equals(Normalizer.normalize(s2, Normalizer.Form.NFKC)));

        // Normalization of compatible codepoints
        final String n1 = "Ⅷ";    // Numeral Roman VIII U+2167
        final String n2 = "VIII";   // 4 uppercase letters
        System.out.printf("n1: %s, len(n1): %d\n", n1, n1.length());
        System.out.printf("n2: %s, len(n2): %s\n", n2, n2.length());
        System.out.printf("n1.equals(n2): %b\n", n1.equals(n2));
        System.out.printf("n1.equals(n2) after NFC normalization:  %b\n",
                Normalizer.normalize(n1, Normalizer.Form.NFC).equals(Normalizer.normalize(n2, Normalizer.Form.NFC)));
        System.out.printf("n1.equals(n2) after NFKC normalization: %b\n",
                Normalizer.normalize(n1, Normalizer.Form.NFKC).equals(Normalizer.normalize(n2, Normalizer.Form.NFKC)));

        // But beware, similar glyphs may not be compatible
        final String g1 = "A";  // Uppercase A = U+0041
        final String g2 = "Α";  // Uppercase greek α = U+0391
        System.out.printf("g1: %s, len(g1): %d\n", g1, g1.length());
        System.out.printf("g2: %s, len(g2): %s\n", g2, g2.length());
        System.out.printf("g1.equals(g2): %b\n", g1.equals(g2));
        System.out.printf("g1.equals(g2) after NFC normalization:  %b\n",
                Normalizer.normalize(g1, Normalizer.Form.NFC).equals(Normalizer.normalize(g2, Normalizer.Form.NFC)));
        System.out.printf("g1.equals(g2) after NFKC normalization: %b\n",
                Normalizer.normalize(g1, Normalizer.Form.NFKC).equals(Normalizer.normalize(g2, Normalizer.Form.NFKC)));

        // Emoji
        // 🐗   ar, U+1F417, UTF-8: 0xF0 0x9F 0x90 0x97, UTF-16: 0xD83D 0xDC17, U
        // F-32: 0x0001F417
        // 🧔   arded Person, U+1F9D4
        // 🧔🏻  Be ded Person+Light Skin Tone, U+1F9D4 U+1F3FB
        // 🧝   f, U+1F9DD
        // 🧝‍♂️ Man Elf, U+1F9DD(🧝) U+200D(ZWJ) U+2642(♂) U+FE0F(VS-16)
        // 🧝‍♀️	Woman E f =  U+1F9D 🧝) U+200D(ZWJ) U+2640(♀) U+FE0F(VS-16)
        // 🧝🏽	Elf  Medium Skin Tone, U+1F9DD (🧝) U+1F3FD (🏽) 
        // 🧝🏽‍♂️ Man Elf: Medium Skin Tone, U+1F9DD (🧝) U+1F3FD (🏽) U+200D(ZWJ) U
        // 2642(♂) U+FE0F(VS-16)
        // 🧝🏽‍♀️ Woman Elf: Medium Skin Tone U+1F9DD (🧝) U+1F3FD (🏽) U+200D(ZWJ) U
        // 2640(♀) U+FE0F(VS-16)

        System.out.println("\nEmoji");
        List<String> e = Arrays.asList("🐗", "🧔", "🧔🏻", "🧝", "🧝‍♂️", "🧝‍♀️", "🧝🏽", "🧝🏽‍♂️", "🧝🏽‍♀️" );
                
        for (String es : e) {
            System.out.printf("%s\t%d\t", es, es.codePointCount(0, es.length()));
            for (int ec : es.codePoints().toArray())
                System.out.printf("%04x ", ec);
            System.out.println();
        }

    }
}
