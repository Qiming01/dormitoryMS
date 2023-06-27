package pro.qiming.service;

import pro.qiming.entity.Fix;
import com.baomidou.mybatisplus.extension.service.IService;
import pro.qiming.form.SearchForm;
import pro.qiming.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hfut
 * @since 2023-06-26
 */
public interface FixService extends IService<Fix> {
    public PageVO list(Integer page, Integer size);
    public PageVO search(SearchForm searchForm);
}
