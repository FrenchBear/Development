using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Controls;
using System.Windows;

namespace DataTemplates
{
public class PropertyDataTemplateSelector : DataTemplateSelector
{
    public DataTemplate DefaultnDataTemplate { get; set; }
    public DataTemplate BooleanDataTemplate { get; set; }
    public DataTemplate EnumDataTemplate { get; set; }

    public override DataTemplate SelectTemplate(object item, DependencyObject container)
    {
        DependencyPropertyInfo dpi = item as DependencyPropertyInfo;
        if (dpi.PropertyType == typeof(bool))
        {
            return BooleanDataTemplate;
        }
        if (dpi.PropertyType.IsEnum)
        {
            return EnumDataTemplate;
        }

        return DefaultnDataTemplate;
    }
}
}
