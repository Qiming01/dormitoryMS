package pro.qiming.service;

import pro.qiming.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;
import pro.qiming.form.SearchForm;
import pro.qiming.form.StudentForm;
import pro.qiming.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hfut
 * @since 2023-06-01
 */
public interface StudentService extends IService<Student> {
    public Boolean saveStudent(Student student);
    public PageVO list(Integer page, Integer size);
    public PageVO search(SearchForm searchForm);
    public Boolean update(StudentForm studentForm);
    public Boolean deleteById(Integer id);
}
