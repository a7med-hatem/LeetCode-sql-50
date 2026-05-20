Select w2.id
from Weather as w1
left join Weather as w2 ON w2.recordDate = DATEADD(day, 1, w1.recordDate)
Where w2.temperature > w1.temperature