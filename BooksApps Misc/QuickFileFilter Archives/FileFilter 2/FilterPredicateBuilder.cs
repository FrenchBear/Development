// FilterPredicateBuilder
// Helper class to build a specific Predicate<object> to filter a List depending on a list of searched words and search options
//
// 2016-12-13   PV  v2.1 Full rewrite in a separate, clean class

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace FileFilter
{
    class FilterPredicateBuilder
    {
        private List<string> words;
        private bool isAS, isCS, isRE, isWW;
        private bool invertFlag;

        public FilterPredicateBuilder(List<string> words, bool isAS, bool isCS, bool isRE, bool isWW, bool invertFlag)
        {
            // Preprocess list of words, remove accents for case-insensitive searches and transform
            // words in regular expressions for whole word searches
            this.words = new List<string>();
            foreach (string w in words)
            {
                string word = isAS ? w : RemoveDiacritics(w);
                if (isWW)
                    word = @"\b" + Regex.Escape(word) + @"\b";
                this.words.Add(word);
            }

            this.isAS = isAS;       // Accent Sensitive
            this.isCS = isCS;       // Case Sensitive
            this.isRE = isRE;       // Regular Expression
            this.isWW = isWW;       // Whole Word
            this.invertFlag = invertFlag;
        }

        // Helper for Accent Insensitive comparisons, remove accents from a string
        private string RemoveDiacritics(string text)
        {
            // Optimization, 1st pass just to check if there is at least 1 accent
            string denorm = text.Normalize(NormalizationForm.FormD);
            bool accentFound = false;
            foreach (char ch in denorm)
                if (CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark)
                {
                    accentFound = true;
                    break;
                }
            if (!accentFound)
                return text;

            StringBuilder sb = new StringBuilder();
            foreach (char ch in denorm)
                if (CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark)
                    sb.Append(ch);
                else
                    accentFound = true;
            return sb.ToString().Normalize(NormalizationForm.FormC);
        }


        public bool GetFilter(object searched)
        {
            foreach (string word in words)
            {
                if (isRE || isWW)
                {
                    try
                    {
                        if (isAS)
                        {
                            if (invertFlag ^ !Regex.IsMatch(((FileNameAndSize)searched).Name, word, isCS ? 0 : RegexOptions.IgnoreCase))
                                return false;
                        }
                        else
                        {
                            if (invertFlag ^ !Regex.IsMatch(RemoveDiacritics(((FileNameAndSize)searched).Name), word, isCS ? 0 : RegexOptions.IgnoreCase))
                                return false;
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
                else
                {
                    if (isAS)
                    {
                        if (invertFlag ^ ((FileNameAndSize)searched).Name.IndexOf(word, isCS ? StringComparison.CurrentCulture : StringComparison.InvariantCultureIgnoreCase) < 0)
                            return false;
                    }
                    else
                    {
                        if (invertFlag ^ RemoveDiacritics(((FileNameAndSize)searched).Name).IndexOf(word, isCS ? StringComparison.CurrentCulture : StringComparison.InvariantCultureIgnoreCase) < 0)
                            return false;
                    }
                }
            }
            return true;
        }
    }
}
