/**
 * Advent of Code day 4.
 *
 * @author      Adri Tungadi (atungadi@deloitte.nl)
 * @created     January 2022
 */
public with sharing class AOC_Day04 {

    public static void part1() {
        String input = inputString.replaceAll('  ', ' ').replaceAll('\n', ' ').replaceAll('  ', ' ');

        List<String> callList = call.split(',');
        List<String> inputList = input.split(' ');
        List<List<String>> bingoList = new List<List<String>>();

        List<String> tmp = new List<String>();
        for(Integer i = 1; i <= inputList.size(); i++) {
            tmp.add(inputList[i-1]);
            if(Math.mod(i, 25) == 0) {
                bingoList.add(tmp);
                tmp = new List<String>();
            }
        }

        Map<Integer, List<Integer>> bingoMap = new Map<Integer, List<Integer>>();
        for(String num : callList) {
            for(List<String> bingo : bingoList) {
                if(!bingoMap.containsKey(bingoList.indexOf(bingo))) {
                    bingoMap.put(bingoList.indexOf(bingo), new List<Integer>());
                }

                if(bingo.contains(num)) {
                    bingoMap.get(bingoList.indexOf(bingo)).add(bingo.indexOf(num));
                }
            }

            for(Integer key : bingoMap.keySet()) {
                List<Integer> bingoIndexList = bingoMap.get(key);
                if(
                    (bingoIndexList.contains(0)
                    && bingoIndexList.contains(1)
                    && bingoIndexList.contains(2)
                    && bingoIndexList.contains(3)
                    && bingoIndexList.contains(4))
                    ||
                    (  bingoIndexList.contains(5)
                    && bingoIndexList.contains(6)
                    && bingoIndexList.contains(7)
                    && bingoIndexList.contains(8)
                    && bingoIndexList.contains(9))
                    ||
                    (  bingoIndexList.contains(10)
                    && bingoIndexList.contains(11)
                    && bingoIndexList.contains(12)
                    && bingoIndexList.contains(13)
                    && bingoIndexList.contains(14))
                    ||
                    (  bingoIndexList.contains(15)
                    && bingoIndexList.contains(16)
                    && bingoIndexList.contains(17)
                    && bingoIndexList.contains(18)
                    && bingoIndexList.contains(19))
                    ||
                    (  bingoIndexList.contains(20)
                    && bingoIndexList.contains(21)
                    && bingoIndexList.contains(22)
                    && bingoIndexList.contains(23)
                    && bingoIndexList.contains(24))
                    ||
                    (  bingoIndexList.contains(0)
                    && bingoIndexList.contains(5)
                    && bingoIndexList.contains(10)
                    && bingoIndexList.contains(15)
                    && bingoIndexList.contains(20))
                    ||
                    (  bingoIndexList.contains(1)
                    && bingoIndexList.contains(6)
                    && bingoIndexList.contains(11)
                    && bingoIndexList.contains(16)
                    && bingoIndexList.contains(21))
                    ||
                    (  bingoIndexList.contains(2)
                    && bingoIndexList.contains(7)
                    && bingoIndexList.contains(12)
                    && bingoIndexList.contains(17)
                    && bingoIndexList.contains(22))
                    ||
                    (  bingoIndexList.contains(3)
                    && bingoIndexList.contains(8)
                    && bingoIndexList.contains(13)
                    && bingoIndexList.contains(18)
                    && bingoIndexList.contains(23))
                    ||
                    (  bingoIndexList.contains(4)
                    && bingoIndexList.contains(9)
                    && bingoIndexList.contains(14)
                    && bingoIndexList.contains(19)
                    && bingoIndexList.contains(24))
                    ) {

                    List<String> winningList = bingoList.get(key);
                    Integer result = 0;
                    for(String bingoNum : winningList) {
                        if(bingoIndexList.contains(winningList.indexOf(bingoNum))) {
                            continue;
                        }
                        result = result + Integer.valueOf(bingoNum);
                    }

                    System.debug('ADRI ' + result * Integer.valueOf(num));
                    return;
                }
            }
        }
    }

    private static void part2() {
        String input = inputString.replaceAll('  ', ' ').replaceAll('\n', ' ').replaceAll('  ', ' ');

        List<String> callList = call.split(',');
        List<String> inputList = input.split(' ');
        List<List<String>> bingoList = new List<List<String>>();

        List<String> tmp = new List<String>();
        for(Integer i = 1; i <= inputList.size(); i++) {
            tmp.add(inputList[i-1]);
            if(Math.mod(i, 25) == 0) {
                bingoList.add(tmp);
                tmp = new List<String>();
            }
        }

        Integer winCount = 0;
        List<Integer> winningIndices = new List<Integer>();
        Map<Integer, List<Integer>> bingoMap = new Map<Integer, List<Integer>>();
        for(String num : callList) {
            for(List<String> bingo : bingoList) {
                if(!bingoMap.containsKey(bingoList.indexOf(bingo))) {
                    bingoMap.put(bingoList.indexOf(bingo), new List<Integer>());
                }

                if(bingo.contains(num)) {
                    bingoMap.get(bingoList.indexOf(bingo)).add(bingo.indexOf(num));
                }
            }

            for(Integer key : bingoMap.keySet()) {
                List<Integer> bingoIndexList = bingoMap.get(key);
                if(
                    (bingoIndexList.contains(0)
                    && bingoIndexList.contains(1)
                    && bingoIndexList.contains(2)
                    && bingoIndexList.contains(3)
                    && bingoIndexList.contains(4))
                    ||
                    (  bingoIndexList.contains(5)
                    && bingoIndexList.contains(6)
                    && bingoIndexList.contains(7)
                    && bingoIndexList.contains(8)
                    && bingoIndexList.contains(9))
                    ||
                    (  bingoIndexList.contains(10)
                    && bingoIndexList.contains(11)
                    && bingoIndexList.contains(12)
                    && bingoIndexList.contains(13)
                    && bingoIndexList.contains(14))
                    ||
                    (  bingoIndexList.contains(15)
                    && bingoIndexList.contains(16)
                    && bingoIndexList.contains(17)
                    && bingoIndexList.contains(18)
                    && bingoIndexList.contains(19))
                    ||
                    (  bingoIndexList.contains(20)
                    && bingoIndexList.contains(21)
                    && bingoIndexList.contains(22)
                    && bingoIndexList.contains(23)
                    && bingoIndexList.contains(24))
                    ||
                    (  bingoIndexList.contains(0)
                    && bingoIndexList.contains(5)
                    && bingoIndexList.contains(10)
                    && bingoIndexList.contains(15)
                    && bingoIndexList.contains(20))
                    ||
                    (  bingoIndexList.contains(1)
                    && bingoIndexList.contains(6)
                    && bingoIndexList.contains(11)
                    && bingoIndexList.contains(16)
                    && bingoIndexList.contains(21))
                    ||
                    (  bingoIndexList.contains(2)
                    && bingoIndexList.contains(7)
                    && bingoIndexList.contains(12)
                    && bingoIndexList.contains(17)
                    && bingoIndexList.contains(22))
                    ||
                    (  bingoIndexList.contains(3)
                    && bingoIndexList.contains(8)
                    && bingoIndexList.contains(13)
                    && bingoIndexList.contains(18)
                    && bingoIndexList.contains(23))
                    ||
                    (  bingoIndexList.contains(4)
                    && bingoIndexList.contains(9)
                    && bingoIndexList.contains(14)
                    && bingoIndexList.contains(19)
                    && bingoIndexList.contains(24))
                    ) {

                    if(winningIndices.contains(key)) {
                        continue;
                    } else {
                        winningIndices.add(key);
                    }

                    List<String> winningList = bingoList.get(key);
                    Integer result = 0;
                    for(String bingoNum : winningList) {
                        if(bingoIndexList.contains(winningList.indexOf(bingoNum))) {
                            continue;
                        }
                        result = result + Integer.valueOf(bingoNum);
                    }

                    winCount++;
                    if(winCount == bingoList.size()) {
                        System.debug('Part 2 : ' + result * Integer.valueOf(num));
                        return;
                    }
                }
            }
        }
    }

    private static String call = '12,28,0,63,26,38,64,17,74,67,51,44,77,32,6,10,52,47,61,46,50,29,15,1,39,37,13,66,45,8,68,96,53,40,76,72,21,93,16,83,62,48,11,9,20,36,91,19,5,42,99,84,4,95,92,89,7,71,34,35,55,22,59,18,49,14,54,85,82,58,24,73,31,97,69,43,65,27,81,56,87,70,33,88,60,2,75,90,57,94,23,30,78,80,41,3,98,25,79,86';
    private static String inputString = '50 79 88 34  0\n' +
            '56 46  5 17 31\n' +
            '29  6 38 78 68\n' +
            '75 57 15 44 83\n' +
            '89 45 43 85 72\n' +
            '\n' +
            '29  8 56 15 33\n' +
            '7 14 51 88 67\n' +
            '91 32 62 18 73\n' +
            '53 63 49 34 46\n' +
            '70 25 77 87 31\n' +
            '\n' +
            '38 92 26 65 77\n' +
            '59 39  4 57 16\n' +
            '91 45 35 36  2\n' +
            '34 40 89  8 62\n' +
            '96 28 31 88 33\n' +
            '\n' +
            '93 96 73 40 13\n' +
            '57 59 88 32 78\n' +
            '48 72 23 42 62\n' +
            '41  7 85 84 44\n' +
            '95 91 52 61  8\n' +
            '\n' +
            '23 42 58 38 46\n' +
            '41 91 92 81 68\n' +
            '12 51 50 64 71\n' +
            '32 13 55 44 35\n' +
            '74  4 40 15 77\n' +
            '\n' +
            '19 79  7 65 77\n' +
            '56 98 93 86 87\n' +
            '5 68  8  2 49\n' +
            '83 45 74 92  6\n' +
            '46 88 33 58 28\n' +
            '\n' +
            '79 82 12 77 30\n' +
            '68  6 70 23 80\n' +
            '24 85 69 91 90\n' +
            '57 15  1 52  8\n' +
            '43 26 44 17 53\n' +
            '\n' +
            '73 88 70 31 44\n' +
            '58 86 16 11 97\n' +
            '36 13 40 79 83\n' +
            '78 25  2  5 91\n' +
            '62  4 29 71 95\n' +
            '\n' +
            '51 96 81 78 86\n' +
            '49 77 12 21 26\n' +
            '66  2 52 31 68\n' +
            '56 74 84 91 45\n' +
            '19  0  8 87 92\n' +
            '\n' +
            '3 13 58 50 17\n' +
            '4 78 69 16 38\n' +
            '91  2 23 21 51\n' +
            '49 79 31 97 90\n' +
            '37 46 12 80 28\n' +
            '\n' +
            '61 11 73 50 39\n' +
            '30 29  0  4 59\n' +
            '18 78  6 27 22\n' +
            '38 14 75 48 43\n' +
            '3 65 82 56 92\n' +
            '\n' +
            '69 11 32 30  1\n' +
            '59 27  4 10 61\n' +
            '28 92 26  6 36\n' +
            '25 76 70 33 97\n' +
            '16 49 84 31 73\n' +
            '\n' +
            '43 77 14 33 87\n' +
            '40 32 97  9 76\n' +
            '59 54  6 73 84\n' +
            '86 44 42 52 38\n' +
            '57  3 16 24 83\n' +
            '\n' +
            '16 55 45 39  1\n' +
            '94 25 75 22 32\n' +
            '3 60 13 91 26\n' +
            '93 86 18 77  8\n' +
            '4 67  5 54 14\n' +
            '\n' +
            '18 87 33 79 26\n' +
            '77 73 95 67 82\n' +
            '70 92 91 43 29\n' +
            '55 71 97 28 59\n' +
            '5 84 81 15 22\n' +
            '\n' +
            '49 29 48 69 83\n' +
            '56 70 39 71 72\n' +
            '68 74  9 94 88\n' +
            '77 96 38 98 14\n' +
            '55  7 16 80 31\n' +
            '\n' +
            '63 51 88 50  9\n' +
            '48 89 75 43 11\n' +
            '27 77 22 80 53\n' +
            '56  4  1 36 52\n' +
            '87 85 30 35 54\n' +
            '\n' +
            '53 39 34 88 51\n' +
            '56 43 19 10  0\n' +
            '85 22 26 25 54\n' +
            '98 62 31 66 48\n' +
            '1  6 58 21 17\n' +
            '\n' +
            '34 47 43  4 16\n' +
            '10  0  1 21 54\n' +
            '3 84 83 51 12\n' +
            '67 35 62 72 11\n' +
            '93 13 30  9 22\n' +
            '\n' +
            '2 67 51 17 36\n' +
            '77 25 73 80 16\n' +
            '33 31 61 41 72\n' +
            '71 98 45 29 15\n' +
            '60 97 69 58 87\n' +
            '\n' +
            '88 46 55 19 68\n' +
            '13 53 71 95 60\n' +
            '75  3 58 82 41\n' +
            '28 16 15 57 81\n' +
            '39  9 34  4 54\n' +
            '\n' +
            '72 38  5 25 57\n' +
            '45 30 33 70 15\n' +
            '43 12  8  1 96\n' +
            '29 52  3 73 78\n' +
            '76 35 40 90 77\n' +
            '\n' +
            '30 18 10 81 74\n' +
            '89 28 32 70 87\n' +
            '1 71 73 36 12\n' +
            '16 78 48 98 53\n' +
            '9 37 49 52 22\n' +
            '\n' +
            '88 21 69 78 59\n' +
            '81  5  6 46 72\n' +
            '76 93 96 50 36\n' +
            '83 19 51 22 68\n' +
            '34 20 39 53 63\n' +
            '\n' +
            '87 64 61 38 28\n' +
            '21 14 11  6 12\n' +
            '51 70 78 40 57\n' +
            '5 37 66 49 85\n' +
            '99 41 81 88 19\n' +
            '\n' +
            '93  9 44 90 49\n' +
            '56 34 83 79 84\n' +
            '38 63 53 78 29\n' +
            '1 94 37 24 86\n' +
            '57  4 52 82  6\n' +
            '\n' +
            '64 31 24 42 33\n' +
            '78 85 95 38 30\n' +
            '43 40 23 52 12\n' +
            '39 84 79 53 57\n' +
            '73 29 56 69 22\n' +
            '\n' +
            '30 31 61 15 22\n' +
            '45  9 43 23 59\n' +
            '34 87 70 52 28\n' +
            '47 86  1 49 39\n' +
            '94 76 98 78 41\n' +
            '\n' +
            '46 71 30 50 45\n' +
            '47  9 56 81  8\n' +
            '60 92 16  6 76\n' +
            '42  4 77 40 54\n' +
            '7 43 32 72 55\n' +
            '\n' +
            '74 26 50 79 38\n' +
            '64 72 49 82 21\n' +
            '93 81 24 45 55\n' +
            '94 22 20 68 71\n' +
            '37 36  3 67  1\n' +
            '\n' +
            '9 76 18 42 14\n' +
            '36 45 48  1 28\n' +
            '94 72 56  7 61\n' +
            '25 82 50 89 99\n' +
            '20 29  3 51 46\n' +
            '\n' +
            '79 56 41 34 18\n' +
            '98 71 75 74 61\n' +
            '10 52 28 29  8\n' +
            '55 84  1  5  2\n' +
            '80 35 40 42  4\n' +
            '\n' +
            '71 54 81 23 80\n' +
            '87 27 98 65 91\n' +
            '2 75  4 99 60\n' +
            '11 17 70 59 50\n' +
            '67 97 77 12 22\n' +
            '\n' +
            '11 72 38 57 17\n' +
            '60 93 16 48 90\n' +
            '73  9 89 68 18\n' +
            '71 59  0 94 12\n' +
            '54 70 96 33 49\n' +
            '\n' +
            '68 40 21 50 17\n' +
            '79 25 76  8  1\n' +
            '72 71 13 39 73\n' +
            '91 98 28 92 53\n' +
            '27 23 62 74 35\n' +
            '\n' +
            '42 97 40 55 69\n' +
            '87 83 21 94 89\n' +
            '28  9  1 13 31\n' +
            '45  4 35 74 25\n' +
            '85 23 80 70 26\n' +
            '\n' +
            '36 22  7 63 87\n' +
            '25 24 60 21 44\n' +
            '84  6  3 31 46\n' +
            '2 32 74 72 96\n' +
            '75 43 50 35 81\n' +
            '\n' +
            '49 56 18 58 94\n' +
            '7 43 45  2 53\n' +
            '75 91 30 81 37\n' +
            '25 50 31 74 82\n' +
            '24 26 98 80 10\n' +
            '\n' +
            '45 33 18 66  7\n' +
            '14 71 60 34  6\n' +
            '23  3 42 22 38\n' +
            '41 88 86 77 30\n' +
            '12 15 70  0 97\n' +
            '\n' +
            '87 41 96 97 15\n' +
            '11 88 64 52 62\n' +
            '26 72 68 18  6\n' +
            '42 35 90  8 14\n' +
            '10  3  0 66 28\n' +
            '\n' +
            '83 46 54 65 96\n' +
            '2 78 43 52 47\n' +
            '77 89 81 53 73\n' +
            '72 91  7 87 56\n' +
            '45 14 21 16 59\n' +
            '\n' +
            '34 62 67 38 58\n' +
            '95 31 43 88 22\n' +
            '40 45 98 80 19\n' +
            '77 94 53 61 14\n' +
            '68 42 47 65 16\n' +
            '\n' +
            '54 13 64 24 73\n' +
            '46  6 91 94 29\n' +
            '55 12 16 65 89\n' +
            '31 28 76 87  2\n' +
            '5  4 83 43 93\n' +
            '\n' +
            '81 89 16 67  5\n' +
            '65 64 70  1 40\n' +
            '3 21 52 53 17\n' +
            '36 19 58  8  0\n' +
            '31  9 79 93 56\n' +
            '\n' +
            '58 98 52 71 56\n' +
            '4 97 48 91 38\n' +
            '43 95 92 85  2\n' +
            '70 10 73 17 26\n' +
            '60 25 20 45 13\n' +
            '\n' +
            '42 53 26 14 20\n' +
            '66 18 28 10 77\n' +
            '23 96 22 25 21\n' +
            '95 52 50 70 94\n' +
            '41 81 45 84 83\n' +
            '\n' +
            '46 80  4 62 97\n' +
            '23 85 47 61 12\n' +
            '9  8 87 72 69\n' +
            '3 30 55  1 54\n' +
            '52 56  7 22 36\n' +
            '\n' +
            '30  7 83 63 47\n' +
            '0 75 20 76 57\n' +
            '98 89 69 22 25\n' +
            '53 66 24 39 33\n' +
            '43  2 19 35 85\n' +
            '\n' +
            '40 11  2 57 54\n' +
            '93 58 37 82 32\n' +
            '24 97  8 49 17\n' +
            '14 89 91 41 79\n' +
            '65  6 55 72 99\n' +
            '\n' +
            '66 14  7 69 98\n' +
            '97 81 80 43 45\n' +
            '11 17 60 89 59\n' +
            '23 58 63 15 84\n' +
            '62 91 33 46 77\n' +
            '\n' +
            '97  1 96 14 31\n' +
            '62  3 69 80  9\n' +
            '11 91 94 85 63\n' +
            '20 30 40 53 64\n' +
            '34 45 18  4 52\n' +
            '\n' +
            '65 75 81 69 53\n' +
            '40 63 98 67 46\n' +
            '1 49 38 73  2\n' +
            '33 99 91 77 90\n' +
            '94 14 21 34 22\n' +
            '\n' +
            '5 37 91 44 57\n' +
            '20 72 27 93 45\n' +
            '86  3 29 84 22\n' +
            '83 73 90 68 21\n' +
            '1 98 40 25 58\n' +
            '\n' +
            '39 22  2 41 91\n' +
            '18 96 21  4 95\n' +
            '75 77 64 85 19\n' +
            '35 83 87 20 93\n' +
            '54 56 81 50 74\n' +
            '\n' +
            '84 91 16 55 14\n' +
            '85 67 18 19  3\n' +
            '17 15 79 82 20\n' +
            '97 47 58 80 28\n' +
            '48 53 89 73 87\n' +
            '\n' +
            '36 91 46 89 22\n' +
            '10 47 58 85 43\n' +
            '20 54 45 57 84\n' +
            '33 51 71 35 29\n' +
            '80 93 24 98 50\n' +
            '\n' +
            '42 10 65 99 61\n' +
            '87 19 58 48 66\n' +
            '36 68  7 63 57\n' +
            '72 20 81 21 96\n' +
            '80 13 15 60 90\n' +
            '\n' +
            '61 37 87 98 69\n' +
            '21 80  7 74 40\n' +
            '93 94 60 39 22\n' +
            '28  8 81 19 42\n' +
            '12 59 34 72 20\n' +
            '\n' +
            '2 40 42  5 74\n' +
            '82 58 93  9 73\n' +
            '38 69 51 33 85\n' +
            '76 26 46 55 70\n' +
            '39 41 89 84  8\n' +
            '\n' +
            '36 99  7 90  3\n' +
            '50  9 71 85 67\n' +
            '92 23 79 28 87\n' +
            '63 56 44 31 52\n' +
            '65 55 62 58 64\n' +
            '\n' +
            '23 28 33  0  2\n' +
            '14 69 92  9 31\n' +
            '77 81 74 71 24\n' +
            '53 19 57 85 61\n' +
            '20 41 21 56 99\n' +
            '\n' +
            '57 68 87 13 80\n' +
            '21  4 95 59 46\n' +
            '29 26 55 89 70\n' +
            '64 66 90 31 34\n' +
            '3 28 12 16 47\n' +
            '\n' +
            '75 20 85 31 82\n' +
            '28 67 83 73 91\n' +
            '19 92 33 96 86\n' +
            '61 39 59 50 74\n' +
            '94 36 69  5 79\n' +
            '\n' +
            '89 63 97 48 51\n' +
            '26  2 31 17 60\n' +
            '47 33 27  3 42\n' +
            '20 88 61 46 68\n' +
            '41 66 90 32 92\n' +
            '\n' +
            '34 46 50 33 28\n' +
            '43 70  3 42 31\n' +
            '10 74 68 80 37\n' +
            '51 58 48  7 75\n' +
            '47 53 35 86 22\n' +
            '\n' +
            '52 17 41 92 58\n' +
            '90 84 65 15 35\n' +
            '24 12 95 70 26\n' +
            '47 29 73 32  8\n' +
            '83 74 56 67 33\n' +
            '\n' +
            '20 86 99 92 28\n' +
            '31 44 68 32  1\n' +
            '87 47 78 98 83\n' +
            '6 50 54 30 93\n' +
            '60  4 58 24 51\n' +
            '\n' +
            '95 59  2 29 75\n' +
            '32 42 30 48  5\n' +
            '37 11 82 66 96\n' +
            '45 28 69 52  0\n' +
            '36 57 46 12 55\n' +
            '\n' +
            '31 65 46 59 27\n' +
            '85 70 75 13 48\n' +
            '42  0 51  1 88\n' +
            '40  6 34  8 71\n' +
            '7 22 11 98 25\n' +
            '\n' +
            '5 14 10 19  8\n' +
            '87 35 92 18 82\n' +
            '73 81 36  4 47\n' +
            '57 16 15 79 60\n' +
            '11 90 75 31 28\n' +
            '\n' +
            '21 61  3 56 41\n' +
            '13  8 29 92 31\n' +
            '35 46 30 26 57\n' +
            '11 66 58 47 43\n' +
            '50 70 40 68 69\n' +
            '\n' +
            '71 27 86 78 58\n' +
            '98  7 26 66 17\n' +
            '77 85 62 39 42\n' +
            '88 29 40 48 49\n' +
            '83 89 20 10  0\n' +
            '\n' +
            '5 17 40 55 28\n' +
            '48 19 83 10 97\n' +
            '58 69  9 91 94\n' +
            '80 50  8 43 86\n' +
            '84 21 27 75 67\n' +
            '\n' +
            '36 46 31 75 40\n' +
            '77 34 24 72 93\n' +
            '3 12 65 70 64\n' +
            '28 10 63 59 51\n' +
            '56 25 67  2 80\n' +
            '\n' +
            '75 96 15 26 53\n' +
            '42  0 48 56 85\n' +
            '95  4 12 49 57\n' +
            '9 79 38 93 54\n' +
            '98 82 99 66  8\n' +
            '\n' +
            '93 33 31 41 49\n' +
            '83 96 63 46  8\n' +
            '51 97 47 79 56\n' +
            '43 69 54 38  2\n' +
            '20 21 84 17 70\n' +
            '\n' +
            '84 28 48  9 56\n' +
            '18 22 34 46  1\n' +
            '31 61 87 62 27\n' +
            '13 96 58 95 20\n' +
            '45 10 57 17  0\n' +
            '\n' +
            '63 26 57 96 64\n' +
            '52  9 77  4 44\n' +
            '56 88 76 55 71\n' +
            '33 99 16  7 72\n' +
            '54 27 78 61 24\n' +
            '\n' +
            '98 48 75 24 15\n' +
            '26 27  6 79  5\n' +
            '95 47 56 18 69\n' +
            '37 57  8 61  9\n' +
            '51 91 31 74 36\n' +
            '\n' +
            '84 49  7 90 95\n' +
            '41 27 15  2 87\n' +
            '71  8 34 39 37\n' +
            '57  5 46 40 56\n' +
            '38 65  6 48  4\n' +
            '\n' +
            '92  3 77 66 10\n' +
            '71 83 86 34 18\n' +
            '16 76 54 38 26\n' +
            '8 17 67 30 88\n' +
            '37 50 11 69 62\n' +
            '\n' +
            '77 18 60 80 39\n' +
            '12 66 51 13 14\n' +
            '85 84 57 91 30\n' +
            '46 98 74 71 56\n' +
            '19 62 54  2 65\n' +
            '\n' +
            '68 27 58 13 64\n' +
            '35 16 75 86 90\n' +
            '24 28 38 31 59\n' +
            '21 43 12 84 29\n' +
            '32 51 40 77 39\n' +
            '\n' +
            '99 19 74  0  9\n' +
            '59 92 67 82 69\n' +
            '72 46 63 51 77\n' +
            '2 45 66 28 12\n' +
            '93 38 15 64 27\n' +
            '\n' +
            '96 41 34 58 25\n' +
            '46 91  9 57 72\n' +
            '67 24 68 36 15\n' +
            '0 30 78 63 49\n' +
            '87 50 82 32 75\n' +
            '\n' +
            '10  3 82 73 51\n' +
            '94 21 43 45 11\n' +
            '65 83 92 37 86\n' +
            '60 90 32 52  8\n' +
            '87 97 53 99 81\n' +
            '\n' +
            '33 77 21 68 53\n' +
            '67 95 99 17 69\n' +
            '50 62 94 24 34\n' +
            '72 56 63 66 57\n' +
            '15 10 42 84 80\n' +
            '\n' +
            '69 16 75 53 15\n' +
            '18 85  2  5 83\n' +
            '0 33 23 24 89\n' +
            '80 92 74 79 38\n' +
            '31 11 26 84 97\n' +
            '\n' +
            '34 37 93 50 87\n' +
            '31 79  3 39 64\n' +
            '81 22 66 40 85\n' +
            '15 69 42 88 91\n' +
            '68 33 57 60 14\n' +
            '\n' +
            '30 99 47 23  4\n' +
            '71  3 74 22 49\n' +
            '44 76 50 38 88\n' +
            '59 21 27 32 35\n' +
            '46 41 65 24 48\n' +
            '\n' +
            '5 14 81 45 20\n' +
            '91 18 28  7 51\n' +
            '29 24 76 79 84\n' +
            '22 58 27  9 99\n' +
            '67 47 60 85 41\n' +
            '\n' +
            '34 29 50  9 58\n' +
            '87 68 70 72 63\n' +
            '85 10  3 14 18\n' +
            '59 48 19 93 39\n' +
            '61 25 16 26 54\n' +
            '\n' +
            '0  4 94 42 12\n' +
            '64 41 96 85 44\n' +
            '89 61 74 47 97\n' +
            '54 63 33 51 93\n' +
            '3 18 79 86 99\n' +
            '\n' +
            '49 55 24 85 26\n' +
            '50 38  6 87 45\n' +
            '64 44 16 92 72\n' +
            '12 81 90 51 60\n' +
            '0 37 47 54 70\n' +
            '\n' +
            '45 31 27 17 41\n' +
            '10 72  0 76 66\n' +
            '24 32 86 87 97\n' +
            '54 75 62 33 79\n' +
            '92 47 26 11  9\n' +
            '\n' +
            '11 94  1  2  8\n' +
            '38 31 61 48 13\n' +
            '74 85 24 19 78\n' +
            '97 69 20 14 59\n' +
            '26  5 66  4 58\n' +
            '\n' +
            '5 89 53 19 34\n' +
            '50 59 13  9 48\n' +
            '29 94 96 85 10\n' +
            '52 91 17 78 31\n' +
            '63 55 27 66 16\n' +
            '\n' +
            '78 13 16 37 54\n' +
            '17 69 42  6 80\n' +
            '66 87 51 43 21\n' +
            '33 50 44 74 41\n' +
            '36 40 75 22  0\n' +
            '\n' +
            '11 98 86 83 46\n' +
            '32  0 60 31 15\n' +
            '62 96 29 77 22\n' +
            '84  7 36 25 13\n' +
            '34 91 14 92 49\n' +
            '\n' +
            '51 98 64 95 75\n' +
            '88  8 49 89 25\n' +
            '37 53 39 47 18\n' +
            '60 84 77 22 92\n' +
            '52 42 85 21 45';
}