using System.Collections.Concurrent;

var dictionary = new ConcurrentDictionary<int, bool>();
var results = new ConcurrentQueue<int>();

void Process(int value)
{
    if (!dictionary.TryAdd(value, true)) {
        throw new Exception("Could not add value");
    }

    // Build a local copy of the dictionary
    var cachedList = new List<int>();
    foreach (var item in dictionary.Keys)
    {
        cachedList.Add(item);
    }

    Publish(cachedList);
}

void Publish(IEnumerable<int> list)
{
    var count = list.Count();
    results.Enqueue(count);
}

void Check(IEnumerable<int> list)
{
    var sorted = true;
    var previous = 0;
    foreach (var item in list)
    {
        if (item < previous) {
            sorted = false;
            break;
        }
        previous = item;
    }

    if (sorted) {
        Console.WriteLine("Results are sorted!");
    } else {
        Console.WriteLine("FAIL: Results are NOT sorted");
    }
    Console.WriteLine(String.Join(",", list));
}

var tasks = new List<Task>();
for (int i = 0; i < 1000; i++)
{
    var valueToProcess = i;
    var newTask = new Task(() => {
        Process(valueToProcess);
    });
    tasks.Add(newTask);
}

tasks.ForEach((task) => task.Start());
Task.WaitAll(tasks.ToArray());

Check(results);
