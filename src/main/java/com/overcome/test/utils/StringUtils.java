package com.overcome.test.utils;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class StringUtils {

	public static String getTokens(String palabra) {
		if (palabra == null || palabra.trim().isEmpty()) {
			return "";
		} else if (palabra.length() <= 3) {
			return palabra;
		}
		StringBuilder tokens = new StringBuilder();
		if (palabra.indexOf(" ") > 0 || palabra.indexOf(",") > 0) {
			StringTokenizer st = new StringTokenizer(palabra, " ,");
			while (st.hasMoreTokens()) {
				tokens.append(getTokens(st.nextToken())).append(" ");
			}
		} else {
			int length = palabra.length();
			for (int i = 3; i < length; i++) {
				tokens.append(palabra.substring(0, i)).append(" ");
			}
			tokens.append(" ").append(palabra);
		}
		return tokens.toString().substring(0, Math.min(tokens.length(), 1024));
	}

	public static String minimize(String string) {
		return normalize(string.toLowerCase().trim().replaceAll("\\s+", "-").replaceAll("[,.*]", ""));
	}

	public static String getCurrentMonthYearString() {
		Date date = new Date(); // your date
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		return month + "/" + year;
	}

	public static boolean isNumeric(String str) {
		return str.matches("-?\\d+(\\.\\d+)?"); // match a number with optional '-' and decimal.
	}

	public final static String normalize(String s) {
		char[] invalid = "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ".toCharArray();
		char[] valid = "AAAAAAACEEEEIIIIDNOOOOOOUUUUYBaaaaaaaceeeeiiiionoooooouuuuyy".toCharArray();
		for (int i = 0; i < invalid.length; i++) {
			s = s.replace(invalid[i], valid[i]);
		}
		String normalized = Normalizer.normalize(s, Normalizer.Form.NFD);
		// Nos quedamos únicamente con los caracteres ASCII
		Pattern pattern = Pattern.compile("\\P{ASCII}+");
		s = pattern.matcher(normalized).replaceAll("");
		return s;
	}

}
