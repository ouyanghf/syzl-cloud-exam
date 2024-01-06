package net.syzl.exams.repo.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.syzl.exams.core.api.dto.PagingReqDTO;
import net.syzl.exams.core.utils.BeanMapper;
import net.syzl.exams.repo.dto.RepoDTO;
import net.syzl.exams.repo.dto.request.RepoReqDTO;
import net.syzl.exams.repo.dto.response.RepoRespDTO;
import net.syzl.exams.repo.entity.Repo;
import net.syzl.exams.repo.mapper.RepoMapper;
import net.syzl.exams.repo.service.RepoService;
import org.springframework.stereotype.Service;

/**
* <p>
* 语言设置 服务实现类
* </p>
*
* @author admin
* @since 2020-05-25 13:23
*/
@Service
public class RepoServiceImpl extends ServiceImpl<RepoMapper, Repo> implements RepoService {

    @Override
    public IPage<RepoRespDTO> paging(PagingReqDTO<RepoReqDTO> reqDTO) {
        return baseMapper.paging(reqDTO.toPage(), reqDTO.getParams());
     }

    @Override
    public void save(RepoDTO reqDTO) {

        //复制参数
        Repo entity = new Repo();
        BeanMapper.copy(reqDTO, entity);
        this.saveOrUpdate(entity);
    }
}
