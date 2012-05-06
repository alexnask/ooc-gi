use gi
import gi/[BaseInfo, TypeInfo]

ConstantInfo: cover from GIConstantInfo* extends BaseInfo {
    getType: extern(g_constant_info_get_type) func -> TypeInfo
}
