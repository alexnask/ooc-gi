use gi
import gi/[BaseInfo, TypeInfo]

Direction: extern(GIDirection) enum {
    in: extern(GI_DIRECTION_IN),
    out: extern(GI_DIRECTION_OUT),
    inout: extern(GI_DIRECTION_INOUT)
}

ScopeType: extern(GIScopeType) enum {
    invalid: extern(GI_SCOPE_TYPE_INVALID),
    call: extern(GI_SCOPE_TYPE_CALL),
    async: extern(GI_SCOPE_TYPE_ASYNC),
    notified: extern(GI_SCOPE_TYPE_NOTIFIED)
}

Transfer: extern(GITransfer) enum {
    nothing: extern(GI_TRANSFER_NOTHING),
    container: extern(GI_TRANSFER_CONTAINER),
    everything: extern(GI_TRANSFER_EVERYTHING)
}

ArgInfo: cover from GIArgInfo* extends BaseInfo {
    getDirection: extern(g_arg_info_get_direction) func -> Direction
    isCallerAllocates?: extern(g_arg_info_is_caller_allocates) func -> Bool
    isReturnValue?: extern(g_arg_info_is_return_value) func -> Bool
    isOptional?: extern(g_arg_info_is_optional) func -> Bool
    mayBeNull?: extern(g_arg_info_may_be_null) func -> Bool
    getOwnershipTransfer: extern(g_arg_info_get_ownership_transfer) func -> Transfer
    getScope: extern(g_arg_info_get_scope) func -> ScopeType
    getClosure: extern(g_arg_info_get_closure) func -> Int
    getDestroy: extern(g_arg_info_get_destroy) func -> Int
    getType: extern(g_arg_info_get_type) func -> TypeInfo
    loadType: extern(g_arg_info_load_type) func(type: TypeInfo)
}
