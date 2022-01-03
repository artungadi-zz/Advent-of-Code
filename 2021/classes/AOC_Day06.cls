/**
 * Advent of Code day 6.
 *
 * @author      Adri Tungadi (atungadi@deloitte.nl)
 * @created     January 2022
 */
public with sharing class AOC_Day06 {

    private static List<Integer> input = new List<Integer> {
        1,3,1,5,5,1,1,1,5,1,1,1,3,1,1,4,3,1,1,2,2,4,2,1,3,3,2,4,4,4,1,3,1,1,4,3,1,5,5,1,1,3,4,2,1,5,3,4,5,5,2,5,5,1,5,5,2,1,5,1,1,2,1,1,1,4,4,1,3,3,1,5,4,4,3,4,3,3,1,1,3,4,1,5,5,2,5,2,2,4,1,2,5,2,1,2,5,4,1,1,1,1,1,4,1,1,3,1,5,2,5,1,3,1,5,3,3,2,2,1,5,1,1,1,2,1,1,2,1,1,2,1,5,3,5,2,5,2,2,2,1,1,1,5,5,2,2,1,1,3,4,1,1,3,1,3,5,1,4,1,4,1,3,1,4,1,1,1,1,2,1,4,5,4,5,5,2,1,3,1,4,2,5,1,1,3,5,2,1,2,2,5,1,2,2,4,5,2,1,1,1,1,2,2,3,1,5,5,5,3,2,4,2,4,1,5,3,1,4,4,2,4,2,2,4,4,4,4,1,3,4,3,2,1,3,5,3,1,5,5,4,1,5,1,2,4,2,5,4,1,3,3,1,4,1,3,3,3,1,3,1,1,1,1,4,1,2,3,1,3,3,5,2,3,1,1,1,5,5,4,1,2,3,1,3,1,1,4,1,3,2,2,1,1,1,3,4,3,1,3
    };

    public static void part1() {
        for(Integer i = 0; i < 80; i++) {
            Integer size = input.size();
            for(Integer x = 0; x < size; x++) {
                Integer current = input[x];
                if(current == 0) {
                    input.add(8);
                    input[x] = 6;
                } else {
                    input[x] = input[x] - 1;
                }
            }
        }

        System.debug('Part 1 : ' + input.size());
    }

    public static void part2() {
        Map<Long, Long> inputMap = new Map<Long, Long> {
            0 => 0,
            1 => 0,
            2 => 0,
            3 => 0,
            4 => 0,
            5 => 0,
            6 => 0,
            7 => 0,
            8 => 0
        };

        for(Long i : input) {
            inputMap.put(i, inputMap.get(i) + 1);
        }

        for(Integer i = 0; i < 256; i++) {
            Long zero = 0;
            for(Long x : inputMap.keySet()) {
                if(x == 0) {
                    zero = inputMap.get(x);
                } else {
                    inputMap.put(x-1, inputMap.get(x));
                }
            }
            inputMap.put(6, inputMap.get(6) + zero);
            inputMap.put(8, zero);
        }

        Long result = 0;
        for(Long val : inputMap.values()) {
            result = result + val;
        }

        System.debug('Part 2 : ' + result);
    }
}