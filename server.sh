mem_usage=$(free -h | grep Mem | awk '{print $3 " / " $2 " (" $3/$2*100 "%)"}')
echo "Memory Usage: $mem_usage"
mem_usage=$(free -h | grep Swap | awk '{print $3 " / " $2 " (" $3/$2*100 "%)"}')
echo "Swap Usage: $mem_usage"

echo -e "\n"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo $"CPU Usage: $cpu_usage"

top_cpu_processes=$(ps aux --sort=-%cpu | head -n 6)
echo -e "\nTop 5 CPU consuming processes:"
echo "$top_cpu_processes"
