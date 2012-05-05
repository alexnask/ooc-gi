use gi
import gi/Repository

InfoType: extern(GIInfoType) enum {
    invalid: extern(GI_INFO_TYPE_INVALID),
    function: extern(GI_INFO_TYPE_FUNCTION),
    callback: extern(GI_INFO_TYPE_CALLBACK),
    struct: extern(GI_INFO_TYPE_STRUCT),
    boxed: extern(GI_INFO_TYPE_BOXED),
    _enum: extern(GI_INFO_TYPE_ENUM),
    flags: extern(GI_INFO_TYPE_FLAGS),
    object: extern(GI_INFO_TYPE_OBJECT),
    _interface: extern(GI_INFO_TYPE_INTERFACE),
    constanct: extern(GI_INFO_TYPE_CONSTANT),
    invalid_0: extern(GI_INFO_TYPE_INVALID_0),
    union: extern(GI_INFO_TYPE_UNION),
    value: extern(GI_INFO_TYPE_VALUE),
    signal: extern(GI_INFO_TYPE_SIGNAL),
    vfunc: extern(GI_INFO_TYPE_VFUNC),
    property: extern(GI_INFO_TYPE_PROPERTY),
    field: extern(GI_INFO_TYPE_FIELD),
    arg: extern(GI_INFO_TYPE_ARG),
    unresolved: extern(GI_INFO_TYPE_UNRESOLVED)

    toString: extern(g_info_type_to_string) func -> CString
}

AttributeIter: cover from GIAttributeIter

BaseInfo: cover from GIBaseInfo* {
    ref: extern(g_base_info_ref) func -> This
    unref: extern(g_base_info_unref) func
    getType: extern(g_base_info_get_type) func -> InfoType
    getName: extern(g_base_info_get_name) func -> CString
    getNamespace: extern(g_base_info_get_namespace) func -> CString
    deprecated?: extern(g_base_info_is_deprecated) func -> Bool
    getAttribute: extern(g_base_info_get_attribute) func(name: CString) -> CString
    iterateAttributes: extern(g_base_info_iterate_attributes) func(iter: AttributeIter*, name: CString*, value: CString*) -> Bool
    eachAttribute: func(f: Func(CString, CString)) {
        name, value: CString
        iter := (null, null) as AttributeIter
        while(iterateAttributes(iter&, name&, value&)) {
            f(name, value)
        }
    }
    getContainer: extern(g_base_info_get_container) func -> This
    getTypeLib: extern(g_base_info_get_typelib) func -> TypeLib
    equals?: extern(g_base_info_equal) func(other: This) -> Bool

    isCallableInfo?: extern(GI_IS_CALLABLE_INFO) func -> Bool
    isArgInfo?: extern(GI_IS_ARG_INFO) func -> Bool
    isTypeInfo?: extern(GI_IS_TYPE_INFO) func -> Bool
}

operator == (l,r: BaseInfo) -> Bool {
    l equals?(r)
}

