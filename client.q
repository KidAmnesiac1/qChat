\q

show"What is your name?";
name:read0 0;

h:hopen `$":grv-infobright:1234";

show"To exit, just type exit";

.z.pi:{if[x like "exit*"; exit 0]; neg[h] string[x]};
.z.ps:{if[all x ~ "exit"; show "IM Server is down";exit 0]; value x}
/.z.ps:{show each x; value x}
