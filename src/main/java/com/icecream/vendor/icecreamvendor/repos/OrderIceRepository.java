package com.icecream.vendor.icecreamvendor.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.icecream.vendor.icecreamvendor.entities.OrderIce;

public interface OrderIceRepository extends JpaRepository<OrderIce, Integer>{
	@Transactional
	@Modifying
	@Query("UPDATE OrderIce c SET c.status = :status WHERE c.id = :id")
    void updateOrderIce(@Param("id") int id, @Param("status") char status);
	
	@Query(value = "SELECT * FROM orderice t WHERE t.status != 'D'",
            nativeQuery=true
    )
    List<OrderIce> selectOrderIce();
}
