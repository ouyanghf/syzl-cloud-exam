package net.syzl.exams.qu.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.google.common.collect.Lists;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import net.syzl.exams.core.api.ApiRest;
import net.syzl.exams.core.api.controller.BaseController;
import net.syzl.exams.core.api.dto.BaseIdReqDTO;
import net.syzl.exams.core.api.dto.BaseIdRespDTO;
import net.syzl.exams.core.api.dto.BaseIdsReqDTO;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.core.exception.ServiceException;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.framework.common.excel.ExcelFinishCallBack;
import net.syzl.framework.common.utils.ExcelUtils;
import net.syzl.exams.qu.dto.QuDTO;
import net.syzl.exams.qu.dto.export.QuExportDTO;
import net.syzl.exams.qu.dto.export.TiExportDTO;
import net.syzl.exams.qu.dto.ext.QuDetailDTO;
import net.syzl.exams.qu.dto.request.QuQueryReqDTO;
import net.syzl.exams.qu.dto.request.QuRepoSelectDTO;
import net.syzl.exams.qu.entity.Qu;
import net.syzl.exams.qu.service.QuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
* <p>
* 问题题目控制器
* </p>
*
* @author admin
* @since 2020-05-25 13:25
*/
@Tag(name ="问题题目")
@RestController
@RequestMapping("/exam/api/qu/qu")
public class QuController extends BaseController {

    @Autowired
    private QuService baseService;

    /**
     * 添加或修改
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary ="添加或修改")
    @RequestMapping(value = "/save", method = {RequestMethod.POST})
    public ApiRest<BaseIdRespDTO> save(@RequestBody QuDetailDTO reqDTO) {
        baseService.save(reqDTO);
        return super.success();
    }

    /**
     * 批量删除
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary ="批量删除")
    @RequestMapping(value = "/delete", method = {RequestMethod.POST})
    public ApiRest edit(@RequestBody BaseIdsReqDTO reqDTO) {
        //根据ID删除
        baseService.delete(reqDTO.getIds());
        return super.success();
    }

    /**
     * 查找详情
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary ="查找详情")
    @RequestMapping(value = "/detail", method = {RequestMethod.POST})
    public ApiRest<QuDetailDTO> detail(@RequestBody BaseIdReqDTO reqDTO) {
        QuDetailDTO dto = baseService.detail(reqDTO.getId());
        return super.success(dto);
    }

    /**
     * 分页查找
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary ="分页查找")
    @RequestMapping(value = "/paging", method = {RequestMethod.POST})
    public ApiRest<IPage<QuDTO>> paging(@RequestBody PagingReqDTO<QuQueryReqDTO> reqDTO) {

        //分页查询并转换
        IPage<QuDTO> page = baseService.paging(reqDTO);

        return super.success(page);
    }

    /**
     * 查找列表，每次最多返回200条数据
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary ="查找列表")
    @RequestMapping(value = "/list", method = {RequestMethod.POST})
    public ApiRest<List<QuDTO>> list(@RequestBody QuDTO reqDTO) {

        //分页查询并转换
        QueryWrapper<Qu> wrapper = new QueryWrapper<>();

        //转换并返回
        List<Qu> list = baseService.list(wrapper);

        //转换数据
        List<QuDTO> dtoList = BeanMapper.mapList(list, QuDTO.class);

        return super.success(dtoList);
    }
    /**
     * 查找列表，每次最多返回200条数据
     *
     * @param reqDTO
     * @return
     */
    @Operation(summary ="查找列表")
    @RequestMapping(value = "/quSelect", method = {RequestMethod.POST})
    public ApiRest<IPage<QuDTO>> quSelect(@RequestBody PagingReqDTO<QuRepoSelectDTO> reqDTO) {

        //分页查询并转换
        IPage<QuDTO> page = baseService.quSelect(reqDTO);

        return super.success(page);
    }



    /**
     * 导出excel文件
     */
    @ResponseBody
    @RequestMapping(value = "/export")
    public ApiRest exportFile(HttpServletResponse response, @RequestBody QuQueryReqDTO reqDTO) {


        // 导出文件名
        String fileName = "导出的试题-" + System.currentTimeMillis() + ".xlsx";

        try {

            int no = 0;
            String quId = "";
            List<QuExportDTO> list = baseService.listForExport(reqDTO);
            for (QuExportDTO item : list) {
                if (!quId.equals(item.getQId())) {
                    quId = item.getQId();
                    no += 1;
                } else {
                    item.setQuType("0");
                    item.setQContent("");
                    item.setQAnalysis("");
                    item.setRepoList(null);
                    item.setQImage("");
                    item.setQVideo("");
                }
                item.setNo(String.valueOf(no));
            }
            // 写到浏览器打开
            ExcelUtils.excelExport(QuExportDTO.class, fileName , null, list);
//            new ExportExcel("试题", QuExportDTO.class).setDataList(list).write(response, fileName).dispose();
            return super.success();
        } catch (Exception e) {
            return failure(e.getMessage());
        }
    }
    /**
     * 导入Excel
     *
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "import")
    public ApiRest importTi(@RequestParam("file") MultipartFile file) {
        try {
            ExcelUtils.readAnalysis(file, TiExportDTO.class, new ExcelFinishCallBack<TiExportDTO>() {
                @Override
                public void doAfterAllAnalysed(List<TiExportDTO> result) {
                    saveUser(result);
                }

                @Override
                public void doSaveBatch(List<TiExportDTO> result) {
                    saveUser(result);
                }

                private void saveUser(List<TiExportDTO> result) {
                    // 校验数据
                     checkExcelTi(result);
                    // 导入数据条数
                    baseService.importTi(result);
                }
            });

            // 导入成功
            return super.success();
        } catch ( Exception e) {
        }

        return super.failure();
    }
    /**
     * 校验Excel
     *
     * @param list
     * @throws Exception
     */
    private void checkExcelTi(List<TiExportDTO> list) throws ServiceException {
        // 约定第三行开始导入
        int line = 3;
        StringBuffer sb = new StringBuffer();
        if (CollectionUtils.isEmpty(list)) {
            throw new ServiceException(1, "您导入的数据似乎是一个空表格！");
        }
        for (TiExportDTO item : list) {
            System.out.println(item.getNo());
            if (StringUtils.isBlank(item.getNo())) {
                line++;
                continue;
            }
            System.out.println(item.getContent());
            Integer no;
            try {
                no = Integer.parseInt(item.getNo());
            } catch (Exception e) {
                line++;
                continue;
            }
            if (no == null) {
                sb.append("第" + line + "行，题目序号不能为空！<br>");
            }
            if (StringUtils.isBlank(item.getRepoNo())) {
                sb.append("第" + line + "行，所属量表不能为空<br>");
            }
            if (StringUtils.isBlank(item.getContent())) {
                sb.append("第" + line + "行，题目内容不能为空<br>");
            }
            line++;
        }

        // 存在错误
        if (!"".equals(sb.toString())) {
            throw new ServiceException(1, sb.toString());
        }
    }

    /**
     * 导入Excel
     *
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "importFile")
    public ApiRest importFile(@RequestParam("file") MultipartFile file) {

        try {

            ExcelUtils.readAnalysis(file, QuExportDTO.class, new ExcelFinishCallBack<QuExportDTO>() {
                @Override
                public void doAfterAllAnalysed(List<QuExportDTO> result) {
                    saveUser(result);
                }

                @Override
                public void doSaveBatch(List<QuExportDTO> result) {
                    saveUser(result);
                }

                private void saveUser(List<QuExportDTO> result) {
                    // 校验数据
                    checkExcel(result);
                    // 导入数据条数
                    baseService.importExcel(result);
                }
            });


            // 导入成功
            return super.success();

        } catch ( Exception e) {
        }

        return super.failure();
    }

    /**
     * 校验Excel
     *
     * @param list
     * @throws Exception
     */
    private void checkExcel(List<QuExportDTO> list) throws ServiceException {
        // 约定第三行开始导入
        int line = 3;
        StringBuffer sb = new StringBuffer();
        if (CollectionUtils.isEmpty(list)) {
            throw new ServiceException(1, "您导入的数据似乎是一个空表格！");
        }
        Integer quNo = null;
        for (QuExportDTO item : list) {
            System.out.println(item.getNo());
            if (StringUtils.isBlank(item.getNo())) {
                line++;
                continue;
            }
            System.out.println(item.getQContent());
            Integer no;
            try {
                no = Integer.parseInt(item.getNo());
            } catch (Exception e) {
                line++;
                continue;
            }
            if (no == null) {
                sb.append("第" + line + "行，题目序号不能为空！<br>");
            }
            if (quNo == null || !quNo.equals(no)) {
                if (item.getQuType() == null) {
                    sb.append("第" + line + "行，题目类型不能为空<br>");
                }
                if (StringUtils.isBlank(item.getQContent())) {
                    sb.append("第" + line + "行，题目内容不能为空<br>");
                }
                if (CollectionUtils.isEmpty(item.getRepoList())) {
                    sb.append("第" + line + "行，题目必须包含一个量表<br>");
                }
            }

            if (StringUtils.isBlank(item.getAIsRight())) {
                sb.append("第" + line + "行，选项是否正确不能为空<br>");
            }

            if (StringUtils.isBlank(item.getAContent()) && StringUtils.isBlank(item.getAImage())) {
                sb.append("第" + line + "行，选项内容和选项图片必须有一个不为空<br>");
            }

            quNo = no;
            line++;
        }

        // 存在错误
        if (!"".equals(sb.toString())) {
            throw new ServiceException(1, sb.toString());
        }
    }

    /**
     * 下载导入试题数据模板
     */
    @ResponseBody
    @RequestMapping(value = "import/template")
    public ApiRest importFileTemplate(HttpServletResponse response) {
        try {
            String fileName = "试题导入模板.xlsx";
            List<TiExportDTO> list = Lists.newArrayList();
            TiExportDTO ti1= new TiExportDTO();
            ti1.setNo("");
            ti1.setRepoNo("");
            ti1.setContent("");
            ti1.setAContent("");
            ti1.setAItemScore("");
            ti1.setBContent("");
            ti1.setBItemScore("");
            ti1.setCContent("");
            ti1.setCItemScore("");
            ti1.setDContent("");
            ti1.setDItemScore("");
            ti1.setEContent("");
            ti1.setEItemScore("");

//            ti1.setNo("题号");
//            ti1.setRepoNo("量表ID");
//            ti1.setContent("题目内容");
//            ti1.setAContent("A选项");
//            ti1.setAItemScore("A分数");
//            ti1.setBContent("B选项");
//            ti1.setBItemScore("B分数");
//            ti1.setCContent("C选项");
//            ti1.setCItemScore("C分数");
//            ti1.setDContent("D选项");
//            ti1.setDItemScore("D分数");
//            ti1.setEContent("E选项");
//            ti1.setEItemScore("E分数");

            list.add(ti1);

            // 写到浏览器打开
            ExcelUtils.excelExport(TiExportDTO.class, fileName , null, list);
//            new ExportExcel("试题数据", TiExportDTO.class, 1).setDataList(list).write(response, fileName).dispose();
            return super.success();
        } catch (Exception e) {
            return super.failure("导入模板下载失败！失败信息："+e.getMessage());
        }
    }
}
