package pro.qiming.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import pro.qiming.service.*;
import pro.qiming.entity.Fix;
import pro.qiming.entity.Dormitory;
import pro.qiming.entity.Student;
import pro.qiming.form.SearchForm;
import pro.qiming.util.ResultVOUtil;
import pro.qiming.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import pro.qiming.service.FixService;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hfut
 * @since 2023-06-26
 */
@RestController
@RequestMapping("/fix")
public class FixController {


    @Autowired
    private FixService fixService;
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private DormitoryService dormitoryService;
    @Autowired
    private StudentService studentService;


    @GetMapping("/list/{page}/{size}")
    public ResultVO list(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        return ResultVOUtil.success(this.fixService.list(page, size));
    }

    @GetMapping("/search")
    public ResultVO search(SearchForm searchForm){
        return ResultVOUtil.success(this.fixService.search(searchForm));
    }

    @GetMapping("/buildingList")
    public ResultVO buildingList(){
        return ResultVOUtil.success(this.buildingService.list());
    }

    @GetMapping("/findDormitoryByBuildingId/{id}")
    public ResultVO findDormitoryByBuildingId(@PathVariable("id") Integer id){
        QueryWrapper<Dormitory> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("building_id", id);
        List<Dormitory> dormitoryList = this.dormitoryService.list(queryWrapper);
        return ResultVOUtil.success(dormitoryList);
    }

    @GetMapping("/findStudentByDormitoryId/{id}")
    public ResultVO findStudentByDormitoryId(@PathVariable("id") Integer id){
        QueryWrapper<Student> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dormitory_id", id);
        List<Student> studentList = this.studentService.list(queryWrapper);
        return ResultVOUtil.success(studentList);
    }

    @PostMapping("/save")
    public ResultVO save(@RequestBody Fix fix){
        String createDate = fix.getCreateDate();
        createDate = createDate.substring(0, 10);
        fix.setCreateDate(createDate);
        boolean save = this.fixService.save(fix);
        if(!save) return ResultVOUtil.fail();
        return ResultVOUtil.success(null);
    }
}

