using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Data;
using System.Globalization;
using System.Windows.Markup;

namespace DataTemplates
{
    public class EnumToListConverter : MarkupExtension, IValueConverter
    {

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            Type type = value as Type;
            if (type != null && type.IsEnum)
            {
                return Enum.GetNames(type);
            }

            return null;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }


        public override object ProvideValue(IServiceProvider serviceProvider)
        {
            return this;
        }
    }
}
