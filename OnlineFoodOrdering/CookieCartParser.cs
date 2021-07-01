using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineFoodOrdering
{
    public class CookieCartParser
    {
        Dictionary<string, string> dictCookie;

        public CookieCartParser() { }

        public Dictionary<string, string> ToDictionary(string strCookie)
        {
            dictCookie = new Dictionary<string, string>();

            dictCookie = strCookie.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(part => part.Split('=')).ToDictionary(split => split[0], split => split[1]);

            return dictCookie;
        }

        public string Add(string newItemID, string strCookie)
        {
            dictCookie = ToDictionary(strCookie);

            if (dictCookie.Keys.Contains(newItemID))
            {
                int item_quantity = int.Parse(dictCookie[newItemID]);
                item_quantity++;
                dictCookie[newItemID] = item_quantity.ToString();
            }
            else
            {
                dictCookie[newItemID] = "1";
            }

            return Stringify(dictCookie);
        }

        
        public string Remove(string itemIDToRemove, string strCookie)
        {
            dictCookie = ToDictionary(strCookie);

            dictCookie.Remove(itemIDToRemove);

            return Stringify(dictCookie);
        }

        
        public string Update(string itemIDToUpdate, string newData, string strCookie)
        {
            dictCookie = ToDictionary(strCookie);

            if (dictCookie.Keys.Contains(itemIDToUpdate))
            {
                dictCookie[itemIDToUpdate] = newData;
            }

            return Stringify(dictCookie);
        }

        
        public string Stringify(Dictionary<string, string> dictCookie)
        {
            string strCookie = string.Join(",", dictCookie.Select(x => x.Key + "=" + x.Value).ToArray());

            //strCookie += ",";

            return strCookie;
        }

        public int GetNumberOfItems(string strCookie)
        {
            int count = 0;

            dictCookie = ToDictionary(strCookie);

            foreach (KeyValuePair<string, string> item in dictCookie)
            {
                int item_count = int.Parse(item.Value);

                count += item_count;
            }

            return count;
        }
    }
}