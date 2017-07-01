// FilterPredicateBuilder
// Helper class to build a specific Predicate<object> to filter a List depending on a list of searched words and search options
//
// 2016-12-13   PV  v2.1 Full rewrite in a separate, clean class
// 2017-01-01   PV  v2.5.1 Exclusion of search words starting with -; move filter parsing from VM to here

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace QuickFileFilter
{
    class FilterPredicateBuilder
    {
        private readonly List<string> words;
        private readonly bool isAS;
        private readonly bool isCS;
        private readonly bool isRE;
        private readonly bool isWW;

        public FilterPredicateBuilder(string filter, bool isAS, bool isCS, bool isRE, bool isWW)
        {
            // Split query in separate words
            words = new List<string>();
            if (isRE)
            {
                // In Regex mode, the whole filter is considered as a single word, including spaces,
                // and possible leading - (not part of Regex)
                try
                {
                    // reTest is not used, it's there to raise an exception and skip words.Add(filter)
                    // if filter is an invalid or incomplete Regex
                    Regex reTest = new Regex(filter);
                    words.Add(filter);
                }
                catch (Exception)
                {
                }
            }
            else
            {
                IEnumerable<string> wordsList = ParseQuery(filter);

                // Preprocess list of words, remove accents for case-insensitive searches and transform
                // words in regular expressions for whole word searches
                foreach (string oneWord in wordsList)
                {
                    string word = isAS ? oneWord : RemoveDiacritics(oneWord);

                    // Special processing for WholeWords mode, transform each word in a Regex
                    if (isWW)
                    {
                        if (word == "-")
                            continue;

                        // But a leading - is not part of the word but an indicator for search exclusion,
                        // and remains ahead of the Regex so it can later be processed correctly by GetFilter
                        if (word.StartsWith("-"))
                            word = "-" + @"\b" + Regex.Escape(word.Substring(1)) + @"\b";
                        else
                            word = @"\b" + Regex.Escape(word) + @"\b";
                    }
                    words.Add(word);
                }
            }

            // Memorize options
            this.isAS = isAS;       // Accent Sensitive
            this.isCS = isCS;       // Case Sensitive
            this.isRE = isRE;       // Regular Expression
            this.isWW = isWW;       // Whole Word
        }


        // Helper that breaks white-separated words in a List<string>, but words "between quotes" are considered a single
        // word even if they include spaces
        private static IEnumerable<string> ParseQuery(string s)
        {
            var wordsList = new List<string>();
            var word = new StringBuilder();
            bool inQuote = false;

            Action appendWordToList = () =>
            {
                if (word.Length > 0)
                {
                    wordsList.Add(word.ToString());
                    word = new StringBuilder();
                }
            };

            foreach (char c in s)
            {
                if (inQuote)
                {
                    if (c == '"')
                    {
                        inQuote = false;
                        appendWordToList();
                    }
                    else
                        word.Append(c);
                }
                else
                {
                    if (c == '"')
                    {
                        inQuote = true;
                        appendWordToList();
                    }
                    else if (c == ' ')
                    {
                        appendWordToList();
                    }
                    else
                        word.Append(c);
                }
            }
            appendWordToList();

            return wordsList;
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
            return sb.ToString().Normalize(NormalizationForm.FormC);
        }


        public bool GetFilter(object searched)
        {
            foreach (string aWord in words)
            {
                bool invertFlag;
                string word;

                if (aWord.StartsWith("-"))
                {
                    word = aWord.Substring(1);
                    invertFlag = true;
                    if (word.Length == 0)
                        continue;
                }
                else
                {
                    word = aWord;
                    invertFlag = false;
                }

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
                        return true;
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
