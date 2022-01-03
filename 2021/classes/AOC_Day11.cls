/**
 * Advent of Code day 11.
 *
 * @author      Adri Tungadi (atungadi@deloitte.nl)
 * @created     January 2022
 */
public with sharing class AOC_Day11 {

    private static String inputString = '[[6,7,4,4,6,3,8,4,5,5],\n' +
        '[3,1,3,5,7,4,5,4,1,8],\n' +
        '[4,7,5,4,1,2,3,2,7,1],\n' +
        '[4,2,2,4,2,5,7,1,6,1],\n' +
        '[8,1,6,7,1,8,6,5,4,6],\n' +
        '[2,2,6,8,5,7,7,6,7,4],\n' +
        '[7,1,7,7,7,6,8,1,7,5],\n' +
        '[2,6,6,2,2,5,5,2,7,5],\n' +
        '[4,6,5,5,3,4,3,3,7,6],\n' +
        '[7,8,5,2,5,2,6,1,6,8]]';

    public static void part1() {
        List<List<Integer>> input = (List<List<Integer>>) JSON.deserialize(inputString, List<List<Integer>>.class);

        Map<String, Integer> valueMap = new Map<String, Integer>();
        Map<String, List<String>> adjacentMap = new Map<String, List<String>>();

        for(Integer i = 0; i < input.size(); i++) {
            for(Integer j = 0; j < input[i].size(); j++) {
                String key = i + ',' + j;

                valueMap.put(key, input[i][j]);
                adjacentMap.put(key, new List<String>());

                if(i - 1 >= 0 && j - 1 >= 0) { adjacentMap.get(key).add((i-1) + ',' + (j-1)); }
                if(i - 1 >= 0) { adjacentMap.get(key).add((i-1) + ',' + j); }
                if(i - 1 >= 0 && j + 1 < input[i].size()) { adjacentMap.get(key).add((i-1) + ',' + (j+1)); }
                if(j + 1 < input[i].size()) { adjacentMap.get(key).add(i + ',' + (j+1)); }
                if(i + 1 < input.size() && j + 1 < input[i].size()) { adjacentMap.get(key).add((i+1) + ',' + (j+1)); }
                if(i + 1 < input.size()) { adjacentMap.get(key).add((i+1) + ',' + j); }
                if(i + 1 < input.size() && j - 1 >= 0) { adjacentMap.get(key).add((i+1) + ',' + (j-1)); }
                if(j - 1 >= 0) { adjacentMap.get(key).add(i + ',' + (j-1)); }
            }
        }
        Integer counter = 0;
        for(Integer step = 1; step <= 100; step++) {
            List<String> lightsUpList = new List<String>();
            Boolean hasLightsUp = false;
            for(String key : valueMap.keySet()) {
                valueMap.put(key, valueMap.get(key) + 1);
                if(valueMap.get(key) == 10) {
                    counter++;
                    lightsUpList.add(key);
                    hasLightsUp = true;
                }
            }

            Set<String> checkedList = new Set<String>();
            while(hasLightsUp) {
                hasLightsUp = false;
                List<String> tmp = new List<String>();
                for(String key : lightsUpList) {
                    if(!checkedList.contains(key)) {
                        for(String adjacentKey : adjacentMap.get(key)) {
                            valueMap.put(adjacentKey, valueMap.get(adjacentKey) + 1);
                            if(valueMap.get(adjacentKey) == 10) {
                                counter++;
                                tmp.add(adjacentKey);
                                hasLightsUp = true;
                            }
                        }
                    }
                    checkedList.add(key);
                }
                lightsUpList.addAll(tmp);
            }
            for(String key : valueMap.keySet()) {
                if(valueMap.get(key) > 9) {
                    valueMap.put(key, 0);
                }
            }
        }

        System.debug('Part 1 : ' + counter);
    }

    public static void part2() {
        List<List<Integer>> input = (List<List<Integer>>) JSON.deserialize(inputString, List<List<Integer>>.class);

        Map<String, Integer> valueMap = new Map<String, Integer>();
        Map<String, List<String>> adjacentMap = new Map<String, List<String>>();

        for(Integer i = 0; i < input.size(); i++) {
            for(Integer j = 0; j < input[i].size(); j++) {
                String key = i + ',' + j;

                valueMap.put(key, input[i][j]);
                adjacentMap.put(key, new List<String>());

                if(i - 1 >= 0 && j - 1 >= 0) { adjacentMap.get(key).add((i-1) + ',' + (j-1)); }
                if(i - 1 >= 0) { adjacentMap.get(key).add((i-1) + ',' + j); }
                if(i - 1 >= 0 && j + 1 < input[i].size()) { adjacentMap.get(key).add((i-1) + ',' + (j+1)); }
                if(j + 1 < input[i].size()) { adjacentMap.get(key).add(i + ',' + (j+1)); }
                if(i + 1 < input.size() && j + 1 < input[i].size()) { adjacentMap.get(key).add((i+1) + ',' + (j+1)); }
                if(i + 1 < input.size()) { adjacentMap.get(key).add((i+1) + ',' + j); }
                if(i + 1 < input.size() && j - 1 >= 0) { adjacentMap.get(key).add((i+1) + ',' + (j-1)); }
                if(j - 1 >= 0) { adjacentMap.get(key).add(i + ',' + (j-1)); }
            }
        }
        Integer counter = 0;
        Boolean keepGoing = true;
        while(keepGoing) {
            counter++;
            List<String> lightsUpList = new List<String>();
            Boolean hasLightsUp = false;
            for(String key : valueMap.keySet()) {
                valueMap.put(key, valueMap.get(key) + 1);
                if(valueMap.get(key) == 10) {
                    lightsUpList.add(key);
                    hasLightsUp = true;
                }
            }

            Set<String> checkedList = new Set<String>();
            while(hasLightsUp) {
                hasLightsUp = false;
                List<String> tmp = new List<String>();
                for(String key : lightsUpList) {
                    if(!checkedList.contains(key)) {
                        for(String adjacentKey : adjacentMap.get(key)) {
                            valueMap.put(adjacentKey, valueMap.get(adjacentKey) + 1);
                            if(valueMap.get(adjacentKey) == 10) {
                                tmp.add(adjacentKey);
                                hasLightsUp = true;
                            }
                        }
                    }
                    checkedList.add(key);
                }
                lightsUpList.addAll(tmp);
            }
            if(lightsUpList.size() == 100) {
                keepGoing = false;
            }

            for(String key : valueMap.keySet()) {
                if(valueMap.get(key) > 9) {
                    valueMap.put(key, 0);
                }
            }
        }

        System.debug('Part 2 : ' + counter);
    }
}