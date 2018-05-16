package com.lixiang.ssm.entity;

public class ProjectFile {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.id
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.project
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private Integer project;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.project_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private Boolean projectType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.file_name
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private String fileName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.resource_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private Integer resourceType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.file_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private String fileType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_project_file.file_address
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    private String fileAddress;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_project_file
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public ProjectFile(Integer id, Integer project, Boolean projectType, String fileName, Integer resourceType, String fileType, String fileAddress) {
        this.id = id;
        this.project = project;
        this.projectType = projectType;
        this.fileName = fileName;
        this.resourceType = resourceType;
        this.fileType = fileType;
        this.fileAddress = fileAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_project_file
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public ProjectFile() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.id
     *
     * @return the value of t_project_file.id
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.id
     *
     * @param id the value for t_project_file.id
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.project
     *
     * @return the value of t_project_file.project
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public Integer getProject() {
        return project;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.project
     *
     * @param project the value for t_project_file.project
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setProject(Integer project) {
        this.project = project;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.project_type
     *
     * @return the value of t_project_file.project_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public Boolean getProjectType() {
        return projectType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.project_type
     *
     * @param projectType the value for t_project_file.project_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setProjectType(Boolean projectType) {
        this.projectType = projectType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.file_name
     *
     * @return the value of t_project_file.file_name
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.file_name
     *
     * @param fileName the value for t_project_file.file_name
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.resource_type
     *
     * @return the value of t_project_file.resource_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public Integer getResourceType() {
        return resourceType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.resource_type
     *
     * @param resourceType the value for t_project_file.resource_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setResourceType(Integer resourceType) {
        this.resourceType = resourceType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.file_type
     *
     * @return the value of t_project_file.file_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public String getFileType() {
        return fileType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.file_type
     *
     * @param fileType the value for t_project_file.file_type
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setFileType(String fileType) {
        this.fileType = fileType == null ? null : fileType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_project_file.file_address
     *
     * @return the value of t_project_file.file_address
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public String getFileAddress() {
        return fileAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_project_file.file_address
     *
     * @param fileAddress the value for t_project_file.file_address
     *
     * @mbg.generated Wed May 16 11:21:31 CST 2018
     */
    public void setFileAddress(String fileAddress) {
        this.fileAddress = fileAddress == null ? null : fileAddress.trim();
    }
}