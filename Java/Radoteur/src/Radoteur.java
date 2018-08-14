// Radoteur Java
// New clean version of radoteur, to compare languages
// Java Version
// 2014-03-26	PV
// 2015-05-13	PV		Rewrite in a more readable way, making global logic visible
// 2015-05-17   PV      Read from file

// Output:
// arinetierariariesiallllle aurisydinnieudela cele cene cialole clisa dremaneyribonchellonedinnuelis elole ette eyditine fatie liabauliniqurlallvindeli lice llliniande manele mante neline phieallie ringwile tthrance 

import java.io.*;
import java.util.*;
import java.text.Normalizer;

public class Radoteur {

    // If true, read from file, else use embedded list
    private static boolean isFromFile = false;

    // Table of Pairs of Characters
    // index = 1st char, 0=Space, 1..26 = a..z
    // content = all possible followers (duplicates and space included)
    private static String[] tpc = new String[27];

    // from ' ','a'..'z' to 0..26
    private static int chartoindex(char c) {
        return (c >= 'a' && c <= 'z') ? c - 'a' + 1 : 0;
    }

    // from 0..26 to ' ','a'..'z'
    private static char indextochar(int i) {
        return i == 0 ? ' ' : (char) ('a' + i - 1);
    }

    // During analysis phase, add a pair of characters to the table of pairs
    private static void AddPair(char c1, char c2) {
        if (tpc[chartoindex(c1)] == null)
            tpc[chartoindex(c1)] = Character.toString(c2);
        else
            tpc[chartoindex(c1)] += Character.toString(c2);
    }

    // Provide the words
    private static List<String> GetWords() {
        if (isFromFile)
            return readFile("Prénoms UTF-8.txt");
        else {
            String s = "Juliette sophie brigitte géraldine valérie adèle delphine jacqueline yvette julie madeleine justine caroline fabienne maude audrey rosine odile joséphine anne mauricette alice colette suzanne barbara christine viviane marthe honorine hélène fanny sarah renée geneviève clémentine anémone amélie irène marianne sandra virginie karine myriam claudine mariette bernadette laurence rosalie chloé louise sylviane élisabeth blandine frédérique francoise annie catherine christiane rose clotilde annaick gisèle nathalie sonia ella armelle élise vanessa lucette francine christelle magali céline estelle eugénie amandine sylvie liliane claire denise marielle patricia marie élodie lucienne émilie simone monique mathilde andrée béatrice henriette solange arielle emma thérèse judith émeline deborah léonie inès angèle murielle ségolène nadège corinne isabelle emmanuelle noémie véronique lucie pauline carole jeanne clémence adeline bénédicte luce diane marguerite gwendoline cécile aude laure agnès gaëlle charlotte stéphanie agathe édith sabine ingrid florence edwige éléonore sandrine sibrine gwénaelle eulalie lydie martine paulette aurélie";
            // String[] words = new String[]{"Juliette","Sophie","Brigitte", "..."};
            return Arrays.asList(s.split(" "));
        }
    }

    // Simple UTF-8 text file reading function
    private static List<String> readFile(String filename) {
        List<String> records = new ArrayList<String>();
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(filename), "UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                records.add(line);
            }
            reader.close();
            return records;
        } catch (Exception e) {
            System.err.format("Exception occurred trying to read '%s', application folder is '%s'.\n",
                    filename, System.getProperty("user.dir"));
            e.printStackTrace();
            return null;
        }
    }

    // Return a lowercase, no accent version of an input string
    // To remove accents, denormalize Unicode string (separate characters and
    // accents), and only retain letters from output
    private static String NormalizeLower(String s) {
        String sn = Normalizer.normalize(s.toLowerCase(), Normalizer.Form.NFD);
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < sn.length(); i++)
            if (Character.isLetter(sn.charAt(i)))
                sb.append(sn.charAt(i));
        return sb.toString();
    }

    // Entry point
    public static void main(String[] args) {
        // Analyze the words
        List<String> ts = GetWords();
        for (String word : ts) {
            String w = NormalizeLower(word);
            //System.out.println(w);
            char last = ' ';
            for (int i = 0; i < w.length(); i++) {
                AddPair(last, w.charAt(i));
                last = w.charAt(i);
            }
            AddPair(last, ' ');
        }
        
        // Trace: print list of successors for each 1st char of a pair
/*        for (int i = 0; i < 27; i++)
            if (tpc[i] != null)
                System.out.printf("%c --> %s\n", indextochar(i), tpc[i]);
*/
        
        // Generate 20 unique names
        // Generation of new words
        Random rnd = new Random(321);
        List<String> ls = new LinkedList<String>();
        for (int w = 0; w < 20; w++) {
            for (;;) {
                StringBuilder sb = new StringBuilder();

                // Random 1st char non-space that starts a word
                int i = chartoindex(tpc[0].charAt(rnd.nextInt(tpc[0].length())));

                for (int nc = 0; nc < 30; nc++) // 30 char max
                {
                    sb.append(indextochar(i));
                    i = chartoindex(tpc[i].charAt(rnd.nextInt(tpc[i].length())));
                    if (i == 0)
                        break; // Reached a final character
                }

                // Word long enough and new?
                if (sb.length() >= 4 && !ls.contains(sb.toString())) {
                    ls.add(sb.toString());
                    break;
                }
            }
        }
        // Sort & print list
        Collections.sort(ls);
        for (String s : ls)
            System.out.println(s);
    }
}
