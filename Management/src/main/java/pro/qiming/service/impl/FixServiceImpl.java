package pro.qiming.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import pro.qiming.entity.Fix;
import pro.qiming.entity.Building;
import pro.qiming.entity.Dormitory;
import pro.qiming.form.SearchForm;
import pro.qiming.mapper.*;
import pro.qiming.service.FixService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import pro.qiming.vo.FixVO;
import pro.qiming.vo.PageVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hfut
 * @since 2023-06-26
 */
@Service
public class FixServiceImpl extends ServiceImpl<FixMapper, Fix> implements FixService {
    @Autowired
    private FixMapper fixMapper;
    @Autowired
    private BuildingMapper buildingMapper;
    @Autowired
    private DormitoryMapper dormitoryMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Override
    public PageVO list(Integer page, Integer size) {
        Page<Fix> fixPage = new Page<>(page, size);
        Page<Fix> resultPage = this.fixMapper.selectPage(fixPage, null);
        List<FixVO> fixVOList = new ArrayList<>();
        for (Fix fix : resultPage.getRecords()) {
            FixVO fixVO = new FixVO();
            BeanUtils.copyProperties(fix, fixVO);
            fixVO.setBuildingName(this.buildingMapper.selectById(fix.getBuildingId()).getName());
            fixVO.setDormitoryName(this.dormitoryMapper.selectById(fix.getDormitoryId()).getName());
            fixVO.setStudentName(this.studentMapper.selectById(fix.getStudentId()).getName());
            fixVO.setDormitoryAdminName(this.dormitoryAdminMapper.selectById(fix.getDormitoryAdminId()).getName());
            fixVOList.add(fixVO);
        }
        PageVO pageVO = new PageVO();
        pageVO.setTotal(resultPage.getTotal());
        pageVO.setData(fixVOList);
        return pageVO;
    }

    @Override
    public PageVO search(SearchForm searchForm) {
        Page<Fix> fixPage = new Page<>(searchForm.getPage(), searchForm.getSize());
        Page<Fix> resultPage = null;
        if(searchForm.getValue().equals("")){
            resultPage = this.fixMapper.selectPage(fixPage, null);
        } else {
            QueryWrapper<Fix> queryWrapper = new QueryWrapper<>();
            if(searchForm.getKey().equals("buildingName")){
                QueryWrapper<Building> buildingQueryWrapper = new QueryWrapper<>();
                buildingQueryWrapper.like("name", searchForm.getValue());
                List<Building> buildingList = this.buildingMapper.selectList(buildingQueryWrapper);
                List<Integer> idList = new ArrayList<>();
                for (Building building : buildingList) {
                    idList.add(building.getId());
                }
                queryWrapper.in("building_id", idList);
            }
            if(searchForm.getKey().equals("dormitoryName")){
                QueryWrapper<Dormitory> dormitoryQueryWrapper = new QueryWrapper<>();
                dormitoryQueryWrapper.like("name", searchForm.getValue());
                List<Dormitory> dormitoryList = this.dormitoryMapper.selectList(dormitoryQueryWrapper);
                List<Integer> idList = new ArrayList<>();
                for (Dormitory dormitory : dormitoryList) {
                    idList.add(dormitory.getId());
                }
                queryWrapper.in("dormitory_id", idList);
            }
            resultPage = this.fixMapper.selectPage(fixPage, queryWrapper);
        }
        List<FixVO> fixVOList = new ArrayList<>();
        for (Fix fix : resultPage.getRecords()) {
            FixVO fixVO = new FixVO();
            BeanUtils.copyProperties(fix, fixVO);
            fixVO.setBuildingName(this.buildingMapper.selectById(fix.getBuildingId()).getName());
            fixVO.setDormitoryName(this.dormitoryMapper.selectById(fix.getDormitoryId()).getName());
            fixVO.setStudentName(this.studentMapper.selectById(fix.getStudentId()).getName());
            fixVO.setDormitoryAdminName(this.dormitoryAdminMapper.selectById(fix.getDormitoryAdminId()).getName());
            fixVOList.add(fixVO);
        }
        PageVO pageVO = new PageVO();
        pageVO.setTotal(resultPage.getTotal());
        pageVO.setData(fixVOList);
        return pageVO;
    }
}
