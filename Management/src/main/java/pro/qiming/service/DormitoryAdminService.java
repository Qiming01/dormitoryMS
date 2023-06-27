package pro.qiming.service;

import pro.qiming.entity.DormitoryAdmin;
import com.baomidou.mybatisplus.extension.service.IService;
import pro.qiming.form.RuleForm;
import pro.qiming.form.SearchForm;
import pro.qiming.vo.PageVO;
import pro.qiming.vo.ResultVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hfut
 * @since 2023-06-01
 */
public interface DormitoryAdminService extends IService<DormitoryAdmin> {
    public ResultVO login(RuleForm ruleForm);
    public PageVO list(Integer page,Integer size);
    public PageVO search(SearchForm searchForm);
}
