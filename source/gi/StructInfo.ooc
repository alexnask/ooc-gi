use gi
import gi/[RegisteredTypeInfo, FieldInfo, FunctionInfo]


StructInfo: cover from GIStructInfo* extends RegisteredTypeInfo {
    getNFields: extern(g_struct_info_get_n_fields) func -> Int
    getField: extern(g_struct_info_get_field) func(n: Int) -> FieldInfo
    getNMethods: extern(g_struct_info_get_n_methods) func -> Int
    getMethod: extern(g_struct_info_get_method) func(n: Int) -> FunctionInfo
    findMethod: extern(g_struct_info_find_method) func(name: CString) -> FunctionInfo
    getSize: extern(g_struct_info_get_size) func -> UInt
    getAlignment: extern(g_struct_info_get_alignment) func -> UInt
    isGTypeStruct?: extern(g_struct_info_is_gtype_struct) func -> Bool
    isForeign?: extern(g_struct_indo_is_foreign) func -> Bool
}
