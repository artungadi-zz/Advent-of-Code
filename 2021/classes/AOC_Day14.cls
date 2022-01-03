/**
 * Advent of Code day 14.
 *
 * @author      Adri Tungadi (atungadi@deloitte.nl)
 * @created     December 2021
 */
public with sharing class AOC_Day14 {

    public static void part1() {
        String input = 'PPFCHPFNCKOKOSBVCFPP';
        List<String> inputList = input.split('');
        Map<String, Integer> characterMap = new Map<String, Integer>();

        for(Integer step = 0; step < 20; step++) {
            List<String> currentTemplate = new List<String>();
            for(Integer i = 0; i < inputList.size() - 1; i++) {
                String current = inputList[i];
                String middle = inputMap.get(String.join(new List<String>{inputList[i], inputList[i+1]}, ''));
                String leftMiddle = inputMap.get(String.join(new List<String>{inputList[i], middle}, ''));
                String rightMiddle = inputMap.get(String.join(new List<String>{middle, inputList[i+1]}, ''));
                currentTemplate.add(current);
                currentTemplate.add(leftMiddle);
                currentTemplate.add(middle);
                currentTemplate.add(rightMiddle);
            }
            currentTemplate.add(inputList[inputList.size() - 1]);
            inputList = currentTemplate;
        }

        for(String chr : inputList) {
            if(!characterMap.containsKey(chr)) {
                characterMap.put(chr, 0);
            }
            characterMap.put(chr, characterMap.get(chr) + 1);
        }

        List<Integer> charCounts = characterMap.values();
        charCounts.sort();

        System.debug('Part 1 : ' + (charCounts[charCounts.size() - 1] - charCounts[0]));
    }

    private static Map<String, String> inputMap = new Map<String, String> {
        'VC' => 'N',
        'SC' => 'H',
        'CK' => 'P',
        'OK' => 'O',
        'KV' => 'O',
        'HS' => 'B',
        'OH' => 'O',
        'VN' => 'F',
        'FS' => 'S',
        'ON' => 'B',
        'OS' => 'H',
        'PC' => 'B',
        'BP' => 'O',
        'OO' => 'N',
        'BF' => 'K',
        'CN' => 'B',
        'FK' => 'F',
        'NP' => 'K',
        'KK' => 'H',
        'CB' => 'S',
        'CV' => 'K',
        'VS' => 'F',
        'SF' => 'N',
        'KB' => 'H',
        'KN' => 'F',
        'CP' => 'V',
        'BO' => 'N',
        'SS' => 'O',
        'HF' => 'H',
        'NN' => 'F',
        'PP' => 'O',
        'VP' => 'H',
        'BB' => 'K',
        'VB' => 'N',
        'OF' => 'N',
        'SH' => 'S',
        'PO' => 'F',
        'OC' => 'S',
        'NS' => 'C',
        'FH' => 'N',
        'FP' => 'C',
        'SO' => 'P',
        'VK' => 'C',
        'HP' => 'O',
        'PV' => 'S',
        'HN' => 'K',
        'NB' => 'C',
        'NV' => 'K',
        'NK' => 'B',
        'FN' => 'C',
        'VV' => 'N',
        'BN' => 'N',
        'BH' => 'S',
        'FO' => 'V',
        'PK' => 'N',
        'PS' => 'O',
        'CO' => 'K',
        'NO' => 'K',
        'SV' => 'C',
        'KO' => 'V',
        'HC' => 'B',
        'BC' => 'N',
        'PB' => 'C',
        'SK' => 'S',
        'FV' => 'K',
        'HO' => 'O',
        'CF' => 'O',
        'HB' => 'P',
        'SP' => 'N',
        'VH' => 'P',
        'NC' => 'K',
        'KC' => 'B',
        'OV' => 'P',
        'BK' => 'F',
        'FB' => 'F',
        'FF' => 'V',
        'CS' => 'F',
        'CC' => 'H',
        'SB' => 'C',
        'VO' => 'V',
        'VF' => 'O',
        'KP' => 'N',
        'HV' => 'H',
        'PF' => 'H',
        'KH' => 'P',
        'KS' => 'S',
        'BS' => 'H',
        'PH' => 'S',
        'SN' => 'K',
        'HK' => 'P',
        'FC' => 'N',
        'PN' => 'S',
        'HH' => 'N',
        'OB' => 'P',
        'BV' => 'S',
        'KF' => 'N',
        'OP' => 'H',
        'NF' => 'V',
        'CH' => 'K',
        'NH' => 'P'
    };
}