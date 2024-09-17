SELECT p.id, ifnull(xuat.sl_da_ban,0) , ifnull(nhap.sl_nhap,0) FROM products p
                                                                        left JOIN (SELECT  id.product_id as op,ifnull(SUM(id.quantity ),0)  AS sl_nhap
                                                                                   FROM inventories i
                                                                                            JOIN inventory_detail id ON i.id=id.id
                                                                                   GROUP BY id.product_id) AS nhap
                                                                                  ON p.id = nhap.op
                                                                        left JOIN (SELECT d.product_id AS sa,sum(d.quantity_total) AS sl_da_ban
                                                                                   FROM orders o
                                                                                            JOIN order_details d ON o.id = d.order_id
                                                                                   GROUP BY d.product_id) AS xuat
                                                                                  ON p.id = xuat.sa

