package com.lixiang.ssm.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.lixiang.ssm.entity.InvProject;

public interface InvProjectMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_inv_project
     *
     * @mbg.generated Wed May 16 12:04:37 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_inv_project
     *
     * @mbg.generated Wed May 16 12:04:37 CST 2018
     */
    int insert(InvProject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_inv_project
     *
     * @mbg.generated Wed May 16 12:04:37 CST 2018
     */
    int insertSelective(InvProject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_inv_project
     *
     * @mbg.generated Wed May 16 12:04:37 CST 2018
     */
    InvProject selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_inv_project
     *
     * @mbg.generated Wed May 16 12:04:37 CST 2018
     */
    int updateByPrimaryKeySelective(InvProject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_inv_project
     *
     * @mbg.generated Wed May 16 12:04:37 CST 2018
     */
    int updateByPrimaryKey(InvProject record);
    

    /**
     * 按照条件来查询投资项目
     */
    List<InvProject> ListByInvProject(@Param("invProject") InvProject invProject);

    boolean updateProjectStatus(@Param("status") Integer status,@Param("id") Integer id);
    /**
     * 查询全部
     * @param record
     * @return
     */
    List<InvProject> queryAllInvProject(InvProject record);
    
    List<InvProject> queryAllInvProjectByProStatus(InvProject record);
    
    List<InvProject> queryAllInvProjectService(InvProject record);
    
	List<InvProject> listIndexCommendProjects();
	List<InvProject> listIndexCarProjects();
	List<InvProject> listIndexHouseProjects();
	List<InvProject> listIndexObligationProjects();
	
}