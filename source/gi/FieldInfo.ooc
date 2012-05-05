use gi
import gi/[BaseInfo, TypeInfo]

FieldInfoFlags: extern(GIFieldInfoFlags) enum {
    isReadable?: extern(GI_FIELD_IS_READABLE),
    isWritable?: extern(GI_FIELD_IS_WRITABLE)
}

FieldInfo: cover from GIFieldInfo* extends BaseInfo {
    getFlags: extern(g_field_info_get_flags) func -> FieldInfoFlags
    getSize: extern(g_field_info_get_size) func -> Int
    getOffset: extern(g_field_info_get_offset) func -> Int
    getType: extern(g_field_info_get_type) func -> TypeInfo
}
