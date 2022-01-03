/**
 * Advent of Code day 12.
 *
 * @author      Adri Tungadi (atungadi@deloitte.nl)
 * @created     December 2021
 */
public with sharing class AOC_Day12 {

    private static List<String> currentPath = new List<String>();
    private static Map<String, Set<String>> connectionMap = new Map<String, Set<String>>();
    private static Integer finishCounter = 0;
    private static String smallCave = '';

    private static List<String> input = new List<String> {
        'lg-GW',
        'pt-start',
        'pt-uq',
        'nx-lg',
        've-GW',
        'start-nx',
        'GW-start',
        'GW-nx',
        'pt-SM',
        'sx-GW',
        'lg-end',
        'nx-SM',
        'lg-SM',
        'pt-nx',
        'end-ve',
        've-SM',
        'TG-uq',
        'end-SM',
        'SM-uq'
    };

    public static void part1() {
        for(String connectionString : input) {
            List<String> connection = connectionString.split('-');
            if(!connectionMap.containsKey(connection[0])) { connectionMap.put(connection[0], new Set<String>()); }
            if(!connectionMap.containsKey(connection[1])) { connectionMap.put(connection[1], new Set<String>()); }
            connectionMap.get(connection[0]).add(connection[1]);
            connectionMap.get(connection[1]).add(connection[0]);
        }

        checkNextPart1('start');
        System.debug('Part 1 : ' + finishCounter);
    }

    public static void checkNextPart1(String node) {
        currentPath.add(node);

        Set<String> connectionSet = connectionMap.get(node);
        for(String connectionNode : connectionSet) {
            if(connectionNode == 'start') {
                continue;
            } else if(connectionNode.isAllLowerCase() && currentPath.contains(connectionNode)) {
                continue;
            } else if(connectionNode == 'end') {
                finishCounter++;
                continue;
            } else {
                checkNextPart1(connectionNode);
            }
        }
        currentPath.remove(currentPath.size() - 1);
    }

    public static void part2() {
        for(String connectionString : input) {
            List<String> connection = connectionString.split('-');
            if(!connectionMap.containsKey(connection[0])) { connectionMap.put(connection[0], new Set<String>()); }
            if(!connectionMap.containsKey(connection[1])) { connectionMap.put(connection[1], new Set<String>()); }
            connectionMap.get(connection[0]).add(connection[1]);
            connectionMap.get(connection[1]).add(connection[0]);
        }

        checkNextPart2('start');
        System.debug('Part 2 :  ' + finishCounter);
    }

    public static void checkNextPart2(String node) {
        currentPath.add(node);

        Set<String> connectionSet = connectionMap.get(node);
        for(String connectionNode : connectionSet) {
            if(connectionNode == 'start') {
                continue;
            } else if(connectionNode.isAllLowerCase() && currentPath.contains(connectionNode)) {
                if(smallCave == '') {
                    smallCave = connectionNode;
                    checkNextPart2(connectionNode);
                } else {
                    continue;
                }
            } else if(connectionNode == 'end') {
                finishCounter++;
                continue;
            } else {
                checkNextPart2(connectionNode);
            }
        }
        if(currentPath[currentPath.size() - 1] == smallCave) {
            smallCave = '';
        }
        currentPath.remove(currentPath.size() - 1);
    }
}