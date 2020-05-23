--1. Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)
ALTER TABLE ksiegowosc.pracownicy kp ALTER COLUMN telefon TYPE varchar(14) USING telefon::varchar;
UPDATE ksiegowosc.pracownicy kp SET telefon - '(+48) '||kp.telefon

--2.Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333’
UPDATE ksiegowosc.pracownicy kp SET telefon=SUBSTRING(kp.telefon,1,9)||'-'||SUBSTRING(kp.telefon,10,3)||'-'||SUBSTRING(kp.telefon,13,3)

--3. Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter
SELECT UPPER(kp.imie), UPPER(kp.nazwisko), UPPER(kp.adres), UPPER(kp.telefon), LENGTH(kp.nazwisko) 
		FROM ksiegowosc.pracownicy kp 
			ORDER BY length(kp.nazwisko) DESC LIMIT 1

--4. Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
SELECT kp.*,md5(kpen.kwota) AS kwota FROM ksiegowosc.pracownicy kp
	   JOIN ksiegowosc.wynagrodzenie kw ON kw.id_pracownika = kp.id_pracownika 
       JOIN ksiegowosc.pensja kpen ON kpen.id_pensji = kw.id_pensji 
	   
--5.Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
SELECT kp.imie,kp.nazwisko, kpen.kwota, kpr.kwota FROM ksiegowosc.wynagrodzenie kw 
	    LEFT JOIN ksiegowosc.pracownicy kp ON kp.id_pracownika = kw.id_pracownika
        LEFT JOIN ksiegowosc.premia kpr ON kpr.id_premii = kw.id_premii
		LEFT JOIN ksiegowosc.pensja kpen ON kpen.id_pensji=kw.id_pensji
--6.wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
  --Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, 
  --gdzie wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł
  
SELECT 'Pracownik ' || kp.imie || ' ' || kp.nazwisko 
|| ' w dniu ' || kg.data
|| ' otrzymał pensje całkowitą na kwotę ' || kpen.kwota + ksiegowosc.premia.kwota 
|| ' gdzie wynagrodzenie zasadnicze wynosiło: '|| kpen.kwota || ',a premia: ' || kpr.kwota || ', nadgodziny: ' || '0 zł' AS raport
FROM ksiegowosc.pracownicy kp
JOIN ksiegowosc.wynagrodzenie kw ON kw.id_pracownika = kp.id_pracownika 
JOIN ksiegowosc.pensja kpen ON kpen.id_pensji = kw.id_pensji 
JOIN ksiegowosc.premia kpr ON kpr.id_premii =kw.id_premii 
JOIN ksiegowosc.godziny kg ON kp.id_pracownika = kp.id_pracownika

