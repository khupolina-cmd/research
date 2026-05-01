# Методология freshness-first промптов для ChatGPT Deep Research

## Сильнейший вывод

Наиболее надёжный freshness-first промпт для ChatGPT Deep Research — это не просьба «найди самое новое и напиши отчёт», а короткий исследовательский контракт: какой именно результат нужен, что в этой задаче считается «свежим», какие источники имеют приоритет, как выявлять устаревшие материалы, как обрабатывать противоречия и по какому критерию завершать поиск. По текущим материалам entity["company","OpenAI","ai company"] Deep Research уже работает как управляемый агентный процесс: пользователь задаёт источники, получает и редактирует план до запуска, может смещать фокус по ходу исследования, а также приоритизировать конкретные сайты как доверенные источники. Параллельно актуальное руководство OpenAI по prompting рекомендует outcome-first prompts с явными success criteria, constraints, tool rules и stopping conditions и отдельно предупреждает, что унаследованные сверхподробные инструкции часто сужают пространство поиска и делают ответы излишне механистичными. citeturn2view3turn1view4turn3view0turn3view2

Из этого следует главный методический выбор: для задач, где свежесть критична, лучше работает scoping-first, а не answer-first. В доказательной методологии scoping review нужен затем, чтобы сначала очертить поле, источники и критерии включения; data charting и evidence mapping структурируют корпус до нарративного синтеза; быстрые evidence продукты у entity["organization","Всемирная организация здравоохранения","un health agency"] специально привязывают глубину обзора к реальному окну принятия решения, а не делают вид, будто всем темам нужен один и тот же режим поиска. Для Deep Research это естественно переносится либо в двухпроходный режим — сначала карта источников, затем синтез, — либо в один запуск, который явно требует source matrix до финального текста. citeturn8view3turn8view4turn33view0turn12view0turn12view1turn10view1

Фундаментальный методический слой здесь приходит из entity["organization","Cochrane","evidence synthesis group"], entity["organization","JBI","evidence synthesis institute"], PRISMA и верификационных практик; текущий operating layer — из документации OpenAI, официальной логики поисковой свежести у entity["company","Google","search company"], новых rapid-evidence guidance и свежих исследований по query rewriting. Вторичный, но полезный практический слой — наблюдения entity["people","Simon Willison","developer writer"] и entity["people","Ethan Mollick","wharton professor"]: магические «секретные формулы» промптов переоценены, а прозрачный ход поиска, итеративная донастройка и скепсис к непрозрачной выдаче значат больше. Эти practitioner-источники полезны как operational insight, но не должны перевешивать более сильную методическую базу. citeturn23view0turn23view1turn19view0

Практически это сводится к одной формуле: **сначала определить тип свежести, затем расширить recall управляемым набором конкурирующих запросов, затем сделать charting источников, затем проверить claims латерально, и только после этого синтезировать вывод с явной обработкой конфликтов и устаревания**. citeturn5view0turn31view0turn33view0turn15view2turn30view0turn3view4

## Что считать свежестью

Свежесть нельзя оставлять как расплывчатое пожелание, потому что сама поисковая логика понимает её как query-dependent criterion. В официальном руководстве по ranking systems Google прямо сказано, что freshness systems усиливают свежий контент только для запросов, «где этого ожидают», а в объяснении того, как ранжируются результаты, добавлено, что для current news topics, sports scores и company earnings свежесть играет большую роль, чем для стабильных справочных вопросов. Следовательно, хороший freshness-first промпт должен не просто требовать «latest», а задавать, **какой именно тип текущности нужен для этой задачи**. citeturn5view0turn5view1

Операционально полезно различать как минимум пять видов свежести. **Свежесть публикации** — когда важна дата выхода текста. **Свежесть обновления** — когда важнее, когда документ или страница были пересмотрены. **Свежесть активности** — когда нужно подтверждение, что источник или объект реально живой и действует сейчас. **Свежесть evidence signal** — когда ключевой признак новизны приходит не из статьи, а из trial registry, regulator filing, earnings release, draft standard, conference abstract или иной ещё не полностью осевшей первичной фиксации. **Свежесть market signal** — когда релевантность определяет текущий ценовой, релизный или операционный сигнал. Это различение выводится из сочетания поисковой логики Google, рекомендаций Cochrane по trial registers, grey literature и reference chasing, а также из текущих примеров OpenAI, где Deep Research прямо обучают приоритизировать reliable, up-to-date sources разных типов, а не только свежие статьи. citeturn5view1turn8view1turn22view5turn10view1

Отсюда вытекает и stale detection. В freshness-first промпте надо требовать не абстрактную «актуальность», а минимум четыре метки для каждого ключевого источника: дата публикации, дата последнего обновления, тип источника и признак текущей активности или статуса; дополнительно — явно помечать, перекрыт ли он более новым официальным источником. Это особенно важно потому, что Cochrane отдельно предупреждает: веб-поиск хуже воспроизводим, чем библиографический, контент и алгоритмы меняются, а результаты ещё и варьируются из‑за локализации и персонализации; поэтому процесс поиска и решения об итерациях нужно документировать, а важные веб-находки — сохранять локально или архивировать. citeturn29view0turn29view2turn29view4

Из этой же логики следует важное ограничение: **не надо превращать любую тему в recent-only topic**. Для операционного current-state действуют жёсткие окна свежести; для оснований, терминов, классических методик и канонических definitional sources нужен второй слой — старые, но всё ещё действующие основания. Иными словами, правильный freshness-first промпт всегда двухслоен: current guidance сверху, living foundations снизу. citeturn5view0turn5view1turn3view2

## Архитектура промпта

### Обязательные блоки

**Блок результата и решения.** Здесь нужно формулировать не тему как таковую, а решение, которое должен поддержать отчёт: «подготовить brief для руководителя», «сравнить текущие подходы перед закупкой», «дать обзор действующего состояния вопроса». Этот блок повышает relevance и уменьшает типичную LLM-склонность уходить в общие объяснения. Это полностью совпадает и с OpenAI outcome-first guidance, и с help-статьёй Deep Research, где хороший prompt должен ясно задавать question, desired outcome и constraints. citeturn3view0turn2view3

**Блок freshness contract.** Здесь задаётся основной тип свежести, окно текущности и исключения для более старых, но канонических источников. Именно этот блок переводит «fresh» из вкусового пожелания в operational retrieval rule и помогает модели не смешивать старые explainers с current operating guidance. citeturn5view0turn5view1turn22view5

**Блок иерархии источников.** Это, вероятно, самый ценный участок промпта. На первом уровне должны стоять primary current sources-of-record: официальные документы, регуляторы, release notes, стандарт-setting bodies, первичные данные, trial registers, corporate filings и т.д. На втором — сильные вторичные обзоры. На третьем — practitioner материал, field notes, discussion threads и, если они реально нужны, semi-private signals. Такой порядок хорошо переносится из fact-checking и evidence-synthesis: кодекс entity["organization","International Fact-Checking Network","fact-checking network"] требует использовать the best available primary rather than secondary sources где это возможно, а Cochrane отдельно включает grey literature и previous reviews как дополнение, а не замену первичного ядра. citeturn30view0turn30view2turn8view1

**Блок управления search space.** Freshness-first промпт должен по умолчанию использовать известные надёжные домены как **приоритет**, а не как преждевременную тюрьму. Текущая механика Deep Research прямо даёт два режима: ограничить поиск только нужными сайтами или приоритизировать их, сохранив full-web search. Методически более надёжен второй режим: он сохраняет recall и discovery, но снижает риск SEO-shaped засорения. Жёсткий whitelist нужен только там, где compliance, reproducibility или governance важнее discovery. citeturn2view3turn3view2turn31view0turn31view2

**Блок evidence matrix до синтеза.** Это тот элемент, который сильнее всего борется с over-smoothed synthesis. Источники нужно сначала «разложить» в таблицу или charting form: источник, тип, дата публикации, дата обновления, свежесть, основное утверждение, причина включения, риск/ограничение. У JBI data charting в scoping reviews прямо описано как логический и описательный summary, который выравнивается с вопросом обзора; у evidence maps и gap maps смысл тот же — сначала карта и категории, потом интерпретация. Для Deep Research это стоит требовать явно, потому что иначе модель очень легко перескакивает к гладкому prose early. citeturn33view0turn12view0turn12view1

**Блок верификации и обработки противоречий.** Хороший freshness-first промпт обязан требовать lateral reading для незнакомых и спорных доменов, trace-back к original context для важных claims, явный contradiction log и правило арбитража: по hierarchy, directness, recency и methodological strength. Это напрямую переносится из практик entity["organization","Digital Inquiry Group","media literacy org"], обзора McGrew по lateral reading, кодекса IFCN и текущего verification-loop guidance OpenAI. Особенно важно требовать не сглаживать конфликт, а назвать точный отсутствующий факт или конфликтный источник, если неопределённость реальна. citeturn15view0turn15view1turn15view2turn30view0turn30view2turn30view3turn3view3turn3view4

**Блок stopping conditions.** Freshness-first промпт должен говорить модели не «ищи как можно дольше», а «остановись, когда core question уже можно ответить verified-evidence уровнем». Это снижает риск бесконечного drift и одновременно не позволяет раннему ответу выйти без grounding. OpenAI сейчас прямо рекомендует формулировать stop conditions как decision rules, а не перегружать prompt абсолютными инструкциями на каждый шаг. citeturn3view2turn3view4

### Опциональные блоки

**Блок опорного словаря.** Если тема страдает от нестабильной номенклатуры, полезно явно дать доменные синонимы, старые названия, альтернативные термины, названия стандартов и брендов. Это улучшает recall, но только в доменах с реальной терминологической нестабильностью; современное IR-исследование уже показывает, что generic prompt-only rewriting бывает вредным в хорошо сформированных вертикалях с устойчивым жаргоном. Поэтому такой блок должен расширять query pack, а не заменять оригинальную формулировку. citeturn26view2turn31view0

**Блок разведения публичного веба и приватных данных.** Если Deep Research ищет одновременно в публичном интернете и в приватных файлах/коннекторах, в prompt стоит отдельно просить staged workflow: сначала public-web pass, затем частный pass без веба или с жёсткой изоляцией. Это не «tool talk ради tool talk»: OpenAI прямо предупреждает о prompt injection и data exfiltration через страницы или MCP/search results и рекомендует фазировать workflow, если рядом есть чувствительные данные. citeturn22view3

## Последовательность проходов

На практике наиболее надёжная последовательность выглядит так.

1. **Scoping pass.** Сначала нужно уточнить не ответ, а область: сформулировать decision question, основной тип свежести, временное окно, ожидаемый deliverable, hierarchy источников и критерии включения/исключения. Если тема широкая, этот проход должен закончиться не «ответом», а исследовательским планом и макетом source matrix. Именно такой режим соответствует и scoping logic, и текущей механике Deep Research с редактируемым планом до запуска. citeturn2view3turn8view3turn8view4turn33view0

2. **Retrieval fan-out.** Затем нужен не один запрос, а пакет конкурирующих запросов: source-of-record query; broad discovery query; recent-only query, если тема действительно deserves freshness; jargon/synonym query; challenge query вроде `criticism`, `limitations`, `retraction`, `superseded by`, `inactive`, `archived`, `failure` или аналога по домену. При этом исходная пользовательская формулировка должна сохраняться рядом с переформулировками. Это переносит в Deep Research логику high-sensitivity search и couplets of alternative search approaches, но не попадает в ловушку «одна переписанная формулировка решит всё». Последнее особенно важно, потому что новое IR-исследование 2026 года показывает: generic prompt-only rewriting может улучшать retrieval при нестабильной терминологии, но ощутимо ухудшать его в уже хорошо сформированных специализированных вертикалях. citeturn31view0turn31view2turn31view3turn29view0turn26view2

3. **Screening и source matrix.** На этом проходе нужно отсеять дубли, неопознанные аггрегаторы, самоописания источника, старые undated pages и материалы без ясного статуса актуальности. Для каждого оставшегося источника фиксируются source type, priority tier, date published, date updated, freshness status, key claim и limitation. Это перенос JBI-style charting и evidence-mapping прямо в prompt workflow. citeturn33view0turn12view0turn12view1turn30view0

4. **Gap fill и reference chasing.** После screening нужен отдельный проход по предыдущим обзорам, reference lists, forward citation searching и grey literature. Для научных, технических и policy-тем это часто обнаруживает не самые видимые, но самые load-bearing материалы. Cochrane не просто допускает это, а делает просмотр previous reviews и reference lists обязательным или highly desirable элементом robust search. citeturn8view1turn29view0turn29view4

5. **Verification и contradiction pass.** Только после расширения корпуса имеет смысл латерально проверять unfamiliar domains, идти upstream к первоисточнику, проверять major claims минимум по двум named sources, где это возможно, и составлять conflict log. Здесь же нужно решать не только «кто прав», но и «что сильнее по source hierarchy, directness и recency», оставляя часть конфликтов открытыми, если они реально не снимаются. citeturn15view0turn15view1turn15view2turn30view0turn30view2turn30view3turn3view3turn3view4

6. **Синтез.** Финальный pass должен строиться вокруг разделения слоёв: current state; older foundational methods or definitions; unresolved conflicts; excluded stale or weak evidence. Важно явно перечислять, что было отброшено как stale, superseded, weakly evidenced или SEO-shaped, а не просто молча не использовать это. Тогда итоговый текст становится не просто «гладким ответом», а audit-friendly synthesis. citeturn3view4turn5view0turn5view1

Answer-first имеет смысл только для узких вопросов, где primary source очевиден заранее, источник свежести один и конфликтность низкая. Во всех остальных случаях — особенно когда тема широка, домен noisy, а цена ошибки заметна — scoping-first даёт более свежий и более честный результат. citeturn2view3turn5view0turn26view2

## Техники с наибольшей отдачей

Ниже — не длинный каталог, а короткий набор техник, которые чаще всего действительно меняют качество retrieval, а не только стиль текста.

- **Пакет конкурирующих запросов с сохранением оригинальной формулировки.** Наиболее полезен, когда тема или terminology messy, когда открытый веб насыщен SEO и копипастой, или когда ranking monoculture начинает возвращать одни и те же вторичные формулировки. Это сильная transfer-идея из evidence search, но применять её нужно аккуратно: diversified querying полезнее, чем одна «улучшенная» rewrite-версия запроса. citeturn29view0turn31view0turn31view2turn26view2

- **Source matrix до prose.** Наиболее полезна почти всегда, кроме совсем узких низкоставочных вопросов. Это лучший антидот против over-smoothed synthesis, потому что заставляет явно увидеть тип источника, дату, свежесть и ограничения ещё до красивого текста. citeturn33view0turn12view0turn12view1

- **Lateral reading и trace-to-original-context.** Наиболее полезны при unfamiliar domains, спорных claims, цитатах, скриншотах, виральных тезисах и любых источниках, которые слишком хорошо «рассказывают о себе сами». По обзору McGrew именно этому надо explicitly учить; DIG и IFCN сходятся в том, что trustworthy verification требует ухода со страницы, проверки источника по внешним сигналам и возврата к максимально прямому evidence path. citeturn15view0turn15view1turn15view2turn30view0turn30view2

- **Reference chasing, поиск по previous reviews и grey literature.** Наиболее полезны в научных, policy и технических темах, где то, что действительно важно, часто сидит не в top-ranked page, а в библиографии, trial register, review appendix, guideline annex или conference abstract. Для comprehensive search это не факультативная «изысканность», а одна из основных страховок от пропуска нагрузочных материалов. citeturn8view1turn29view4

- **PRESS-like preflight audit перед запуском.** Наиболее полезен именно там, где пользователь хочет улучшить качество Deep Research **до** запуска. Идея проста: перед стартом быстро проверять draft prompt по чеклисту, похожему на peer review of search strategies — правильно ли заданы основные концепты, альтернативные термины, date logic, source tiers, exclusions, contradiction path и stop conditions. Cochrane прямо рекомендует peer review search strategies, а PRESS даёт для этого стандартный инструмент. Для Deep Research это лучше переносить не буквально как библиотечную форму, а как короткий preflight rubric. citeturn31view3turn32view0turn3view4

Самые сильные и лучше всего подтверждённые переносы — это source hierarchy, source matrix, lateral reading, reference chasing и verification loop. Competing queries, anti-mainstream queries и recent-only filters полезны, но более контекстозависимы: они усиливают retrieval тогда, когда вопрос действительно messy, dynamic или ranking-distorted, и вредят, когда вопрос уже изначально сформулирован точно и доменный словарь устойчив. citeturn26view2turn31view0

## Анти-паттерны и аудит наивного промпта

Самые дорогие промахи у freshness-first prompting повторяются довольно стабильно.

- **«Сделай самый свежий отчёт» без определения, что такое свежесть.** Такой промпт смешивает recent publication, updated guidance и current activity в одну кучу и почти гарантирует неверный ranking of evidence. citeturn5view0turn5view1turn10view1

- **Огромный one-shot prompt, который сразу требует окончательный ответ.** Это мешает scoping, не использует редактируемый план Deep Research и легко провоцирует generic synthesis вместо disciplined retrieval. citeturn2view3turn3view0turn3view2turn23view0

- **Recent-only everywhere.** Если жёстко попросить только материалы за последний период по любой теме, модель потеряет foundational methods, исторически действующие стандарты и всё, что не обязано быть свежим по природе вопроса. citeturn5view0turn5view1turn3view2

- **Whitelist prison слишком рано.** Жёсткое ограничение только известными доменами улучшает trust, но часто убивает recall и discovery; в большинстве задач лучше soft prioritization trusted domains, а не premature hard restriction. citeturn2view3turn31view0

- **Доверие верхним результатам и самоописанию сайта.** Для fact-checking и source validation это противоположность хорошей практике: trustworthy evaluation начинается не с того, что источник говорит о себе, а с проверки по внешним источникам и по первичному evidence path. citeturn15view1turn30view0turn5view2turn19view0

- **Сглаживание конфликтов.** Когда prompt не просит contradiction log, модель почти всегда пытается дать «единый аккуратный ответ», даже если источники расходятся. Именно это и создаёт over-smoothed synthesis. citeturn30view2turn30view3turn3view3turn3view4

- **Одна generic rewrite вместо query pack.** Современное IR-исследование уже достаточно ясно показывает, что single-step prompt rewriting помогает не всегда и может портить retrieval на domain-aligned запросах. citeturn26view2

### Наивный baseline prompt

```text
Проведи Deep Research по теме [ТЕМА].
Найди самые свежие материалы в интернете и напиши полный отчёт с выводами и цитатами.
```

### Почему он ломается

Этот baseline выглядит разумно, но методически он почти пустой. В нём нет decision outcome, нет типа свежести, нет time window, нет source hierarchy, нет distinction между current guidance и старыми основаниями, нет criteria for exclusion, нет matrix before synthesis, нет contradiction handling, нет verification loop и нет stopping conditions. В результате он почти приглашает модель сделать то, что LLM делает по умолчанию лучше всего: быстро собрать гладкий, цитатный, но рангово-зависимый и слабо отфильтрованный synthesis. citeturn2view3turn3view0turn3view2turn3view4turn30view0

Если тема ещё и терминологически чувствительна, наивный prompt часто дополнительно подталкивает систему к generic query rewriting. А это как раз тот случай, где retrieval может стать хуже, а не лучше: вместо точного доменного словаря модель начинает подменять его общими или популярными словами корпуса. citeturn26view2

## Готовый мастер-шаблон для вставки

Ниже — не «магическая формула», а компактный reusable template, который собирает вместе strongest transfer-principles: outcome-first prompting, editable scope, source hierarchy, diversified retrieval, source matrix, lateral verification, contradiction handling и stop conditions. Его стоит использовать целиком для high-stakes или freshness-sensitive задач; для узких задач можно сокращать, но лучше не удалять блоки freshness, source hierarchy и verification. citeturn2view3turn3view0turn3view2turn3view4turn33view0turn30view0turn15view2

```text
Проведи Deep Research по теме: [ТЕМА]

Цель исследования:
[Какой именно результат нужен? Какое решение, brief, memo, обзор или сравнение должен поддержать отчёт? Для кого он готовится?]

Что в этой задаче считается «свежим»:
- Основной тип свежести: [публикация / обновление / активность / evidence signal / market signal]
- Основное окно текущности: [например, 30 дней / 90 дней / 12 месяцев / с даты X]
- Более старые источники допускаются только как канонические основания, если они всё ещё действуют и не заменены более новыми.
- Для каждого ключевого источника фиксируй:
  1) дату публикации,
  2) дату обновления, если есть,
  3) признак текущей активности/статуса,
  4) объяснение, почему источник всё ещё релевантен.

Границы:
- Включить: [что обязательно покрыть]
- Не включать: [что исключить]
- Если тема слишком широка, сначала сузь её и верни scoping plan + source map, а уже затем переходи к полному синтезу.

Иерархия источников:
- Приоритет A: [официальные документы, первичные данные, регуляторы, стандарты, release notes, trial registers, filings и т.п.]
- Приоритет B: [сильные вторичные обзоры, систематические обзоры, качественные отраслевые анализы]
- Приоритет C: [практические заметки, экспертные блоги, field notes, обсуждения] — использовать только как вторичный сигнал и явно помечать их как anecdotal / partially transferable.
- Не опирайся на SEO-shaped listicles, анонимные агрегаторы и самоописание источника, если доступны более прямые или первичные материалы.

Логика поиска:
- Начни со scoping-pass: сформулируй план поиска, подтемы, критерии включения/исключения и предполагаемую evidence matrix.
- Затем выполни пакет конкурирующих запросов:
  • source-of-record queries
  • broad discovery queries
  • recent-only queries — только если тема действительно чувствительна к свежести
  • jargon / synonym queries
  • challenge queries: criticism, limitations, retraction, superseded by, inactive, archived, failures, controversies
- Сохраняй исходную пользовательскую формулировку наряду с переформулировками; не полагайся на один rewritten query.
- Если известны несколько надёжных доменов, приоритизируй их, но не ограничивайся только ими, если задача не требует строгого whitelist-режима.
- Ищи глобально; не ограничивай корпус одним языком, если качество источников не требует этого.

Перед финальным синтезом:
- Составь краткую source matrix / evidence matrix с полями:
  источник | тип | уровень приоритета | дата публикации | дата обновления | freshness status | ключевой тезис | причина включения | ограничения/риски
- Для незнакомых или спорных источников выполни lateral reading.
- Для ключевых утверждений найди первоисточник или максимально прямой источник.
- Используй reference chasing: previous reviews, библиографии, forward/backward citation following, если это уместно.
- Включай grey literature только когда она даёт более новый или иначе недоступный сигнал, и отдельно помечай её статус.

Работа с противоречиями:
- Не сглаживай расхождения.
- Если источники конфликтуют, явно покажи:
  1) в чём именно конфликт,
  2) какие источники сильнее по иерархии, прямоте и свежести,
  3) остаётся ли неопределённость.
- Если конфликт не снимается, оставь его открытым и укажи, какой новый факт или источник его разрешил бы.

Проверка на устаревание:
- Помечай как stale / superseded всё, что:
  • не имеет даты там, где дата критична,
  • описывает старое состояние без подтверждения актуальности,
  • конфликтует с более новым официальным источником,
  • идёт с явно заброшенного или неактивного источника.
- Такие материалы можно использовать только как фон, а не как основу окончательного вывода.

Финальный результат:
- Сначала дай краткий ответ на вопрос.
- Затем отдельно раздели:
  • current state / текущее операционное состояние вопроса
  • older but still valid foundations / более старые, но всё ещё полезные основания
  • unresolved conflicts / спорные и не до конца разрешённые места
  • excluded as stale, weak or SEO-shaped / что ты исключил и почему
- Для важных утверждений используй inline citations.
- Используй конкретные даты, а не только слова вроде “recent”, “latest”, “current”.
```

Если задача высокоставочная, лучший режим — двухпроходный: в первом запуске этим же шаблоном просить только scoping plan + source matrix + unresolved gaps, а во втором — уже полный synthesis по очищенному корпусу. Именно так сильнее всего работают и scoping-based evidence methods, и текущая интерфейсная механика Deep Research с редактируемым планом. citeturn2view3turn33view0turn12view1

## Out of scope for this study

Это исследование сознательно **не** делало двух следующих работ.

**Domain-specific differences.** Отдельное исследование должно сравнить, как freshness-first prompting меняется по доменам: fast-moving web/news, academic/scientific, visual/creative, policy/legal, product/market и другим. Здесь такие доменные различия использовались только как краткие stress tests метода, а не как самостоятельный объект анализа.

**Refresh pipeline / continuous monitoring.** Отдельное исследование должно описать, как превращать хороший freshness-first prompt в repeatable refresh process: scheduled reruns, alerts, RSS, saved searches, diffing, human review и контуры обновления. В этой работе такие механики намеренно оставлены за границей, чтобы не смешивать prompt methodology с monitoring pipeline.