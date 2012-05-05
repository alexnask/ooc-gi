use gi
import gi/[BaseInfo, TypeInfo, ArgInfo]

ParamFlags: extern(GParamFlags) enum {
    readable: extern(G_PARAM_READABLE),
    writable: extern(G_PARAM_WRITABLE),
    construct: extern(G_PARAM_CONSTRUCT),
    constructOnly: extern(G_PARAM_CONSTRUCT_ONLY),
    laxValidation: extern(G_PARAM_LAX_VALIDATION),
    staticName: extern(G_PARAM_STATIC_NAME),
    staticNick: extern(G_PARAM_STATIC_NICK),
    staticBlurb: extern(G_PARAM_STATIC_BLURB),
    deprecated: extern(G_PARAM_DEPRECATED)
}

PropertyInfo: cover from GIPropertyInfo* extends BaseInfo {
    getFlags: extern(g_property_info_get_flags) func -> ParamFlags
    getType: extern(g_property_info_get_type) func -> TypeInfo
    getOwnershipTransfer: extern(g_property_info_get_ownership_transfer) func -> Transfer
}

