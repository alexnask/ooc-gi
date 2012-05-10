use gi
import gi/[BaseInfo, RegisteredTypeInfo, FunctionInfo]

EnumInfo: cover from GIEnumInfo* extends RegisteredTypeInfo {
    getNValues: extern(g_enum_info_get_n_values) func -> Int
    getValue: extern(g_enum_info_get_value) func(n: Int) -> ValueInfo
    getNMethods: extern(g_enum_info_get_n_methods) func -> Int
    getMethod: extern(g_enum_info_get_method) func(n: Int) -> FunctionInfo
}

ValueInfo: cover from GIValueInfo* extends BaseInfo {
    getValue: extern(g_value_info_get_value) func -> Int64
}
