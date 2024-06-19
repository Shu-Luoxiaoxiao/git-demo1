#!/bin/bash
printf "Initialization Start!\n"
printf "01-Start Rviz!!!\n"
#链接机械比
gnome-terminal -e --title="Rviz Start!" --command="bash -c 'cd catkin_work;source ./devel/setup.bash;roslaunch aubo_i5_moveit_config moveit_planning_execution.launch robot_ip:=192.168.1.100;$SHELL'"
sleep 5
printf "02-Start easyHandEye!!!\n"
#发布TF变换
gnome-terminal -e --title="Publish Start!" --command="bash -c 'cd catkin_ws;source ./devel/setup.bash;roslaunch easy_handeye publish.launch;$SHELL'"
sleep 5
printf "03-Start Robot!!!\n"
#运行主程序
#打开串口权限 #sudo chmod 777 /dev/ttyUSB*
echo " " | sudo -S chmod 777 /dev/ttyUSB*
sleep 2
gnome-terminal -e --title="Start Moving!" --command="bash -c 'cd catkin_work;source ./devel/setup.bash;rosrun aubo_demo finallydebug_revolve_mqtt;$SHELL'"
sleep 5
printf "04-Start Camera!!!\n"
#打开相机
gnome-terminal -e --title="Start Camera!" --command="bash -c 'cd aubo_robot_ws/src/picking_point_detection/scripts;python3 picking_fusion_camera_only_deep_learning.py;$SHELL'"
sleep 5
printf "05-communication to car!!!\n"
#打开通讯节点
gnome-terminal -e --title="Communication to car!" --command="bash -c 'cd catkin_work;source ./devel/setup.bash;roslaunch aubo_demo communication_to_car.launch;$SHELL'"
sleep 5
printf "06-ros_to_mqtt!!!\n"
#鏈接服務器
gnome-terminal -e --title="ros_to_mqtt!" --command="bash -c 'cd mqtt_bridge;source ./devel/setup.bash;roslaunch mqtt_bridge demo.launch;$SHELL'"
sleep 2
gnome-terminal -e --title="Start jpg!" --command="bash -c 'cd mqtt_bridge;python3 pic.py;$SHELL'"
sleep 5
####### 到达指定位置发送开始信号
printf "07-Start picking!!!\n"
#gnome-terminal -e --title="flag" --command="bash -c 'rostopic pub /com_info std_msgs/String \"data: '1'\";$SHELL'"
#gnome-terminal -x bash -c "rostopic pub /com_info std_msgs/String \"data: '1'\";$SHELL"
#sleep 5
####### 

#发布模拟点
#rostopic pub /chatter std_msgs/String "data: '[-0.284, -0.173, 0.930]'" 
printf "END\n"
printf"this is my_master branch!"
