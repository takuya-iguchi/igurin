package main

import "fmt"
import "time"
import "os"
import "log"
import "bufio"

func main() {
    t := time.Now()
    const layout = "2006-01-02 15:04"
    file, err := os.OpenFile(`D:\tmp\temp.txt`, os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0666)
    if err != nil {
      log.Fatal(err)
    }
    defer file.Close()
    fmt.Fprintln(file, t.Format(layout))
    f, err := os.Open(`D:\tmp\temp.txt`)
    if err != nil {
      log.Fatal(err)
      return
    }
    counts := make(map[string]int)
    input := bufio.NewScanner(f)
    for input.Scan() {
      counts[input.Text()]++
    }
    for line, n := range counts{
      if n > 4 {
        fmt.Printf("%d\t%s\n", n, line)
      }
    }
}
