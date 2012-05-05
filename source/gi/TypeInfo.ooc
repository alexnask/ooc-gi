use gi
import gi/BaseInfo

ArrayType: extern(GIArrayType) enum {
    c: extern(GI_ARRAY_TYPE_C),
    array: extern(GI_ARRAY_TYPE_ARRAY),
    ptrArray: extern(GI_ARRAY_TYPE_PTR_ARRAY),
    byteArray: extern(GI_ARRAY_TYPE_BYTE_ARRAY)
}

TypeTag: extern(GITypeTag) enum {
    void: extern(GI_TYPE_TAG_VOID),
    boolean: extern(GI_TYPE_TAG_BOOLEAN),
    int8: extern(GI_TYPE_TAG_INT8)
    uint8: extern(GI_TYPE_TAG_UINT8),
    int16: extern(GI_TYPE_TAG_INT16),
    uint16: extern(GI_TYPE_TAG_UINT16),
    int32: extern(GI_TYPE_TAG_INT32),
    uint32: extern(GI_TYPE_TAG_UINT32),
    int64: extern(GI_TYPE_TAG_INT64),
    uint64: extern(GI_TYPE_TAG_UINT64),
    float: extern(GI_TYPE_TAG_FLOAT),
    double: extern(GI_TYPE_TAG_DOUBLE),
    gtype: extern(GI_TYPE_TAG_GTYPE),
    utf8: extern(GI_TYPE_TAG_UTF8),
    filename: extern(GI_TYPE_TAG_FILENAME),
    array: extern(GI_TYPE_TAG_ARRAY),
    _interface: extern(GI_TYPE_TAG_INTERFACE),
    glist: extern(GI_TYPE_TAG_GLIST),
    gslist: extern(GI_TYPE_TAG_GSLIST),
    ghash: extern(GI_TYPE_TAG_GHASH),
    error: extern(GI_TYPE_TAG_ERROR),
    unichar: extern(GI_TYPE_TAG_UNICHAR)

    isBasic?: extern(G_TYPE_TAG_IS_BASIC) func -> Bool
    toString: extern(g_type_tag_to_string) func -> CString
}

TypeInfo: cover from GITypeInfo* extends BaseInfo {
    isPointer?: extern(g_type_info_is_pointer) func -> Bool
    getTag: extern(g_type_info_get_tag) func -> TypeTag
    getParamType: extern(g_type_info_get_param_type) func(n: Int) -> TypeInfo
    getInterface: extern(g_type_info_get_interface) func -> BaseInfo
    getArrayLength: extern(g_type_info_get_array_length) func -> Int
    getArrayFixedSize: extern(g_type_info_get_array_fixed_size) func -> Int
    isZeroTerminated?: extern(g_type_is_zero_terminated) func -> Bool
    getArrayType: extern(g_type_info_get_array_type) func -> ArrayType
}
