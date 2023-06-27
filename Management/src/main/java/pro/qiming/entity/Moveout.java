package pro.qiming.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author hfut
 * @since 2023-06-01
 */
@Data
  @EqualsAndHashCode(callSuper = false)
    public class Moveout implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

    private Integer studentId;

    private Integer dormitoryId;

    private String reason;

    private String createDate;


}
