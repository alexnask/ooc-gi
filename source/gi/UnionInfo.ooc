use gi
import gi/[RegisteredTypeInfo, FieldInfo, FunctionInfo, TypeInfo, ConstantInfo]

UnionInfo: cover from GIUnionInfo* extends RegisteredTypeInfo {
    getNFields: extern(g_union_info_get_n_fields) func -> Int
    getField: extern(g_union_info_get_field) func(n: Int) -> FieldInfo
    getNMethods: extern(g_union_info_get_n_methods) func -> Int
    getMethod: extern(g_union_info_get_method) func(n: Int) -> FunctionInfo
    isDiscriminated?: extern(g_union_info_is_discriminated) func -> Bool
    getDiscriminatorOffset: extern(g_union_info_get_discriminator_offset) func -> Int
    getDiscriminatorType: extern(g_union_info_get_discriminator_type) func -> TypeInfo
    getDiscriminator: extern(g_union_get_discriminator) func -> ConstantInfo
    findMethod: extern(g_union_info_find_method) func(name: CString) -> FunctionInfo
    getSize: extern(g_union_info_get_size) func -> UInt
    getAlignment: extern(g_union_info_get_alignment) func -> UInt
}
