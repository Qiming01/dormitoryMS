package pro.qiming.service;

import pro.qiming.entity.SystemAdmin;
import com.baomidou.mybatisplus.extension.service.IService;
import pro.qiming.form.RuleForm;
import pro.qiming.vo.ResultVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hfut
 * @since 2023-06-01
 */
public interface SystemAdminService extends IService<SystemAdmin> {
    public ResultVO login(RuleForm ruleForm);
}
