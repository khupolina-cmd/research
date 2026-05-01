# Центральная майнд-карта глубоких исследований

Эта карта спроектирована не как учебник, а как каркас исследовательской системы: вопрос → корпус источников → извлечение фактов → проверка → синтез → обновление. В качестве методологического основания здесь использованы практики evidence synthesis из entity["organization","Cochrane","evidence synthesis network"], entity["organization","JBI","evidence synthesis org"], PRISMA, GRADE и risk-of-bias-подходов, а для AI-слоя — риск-ориентированный подход entity["organization","NIST","us standards body"] к использованию генеративных систем. citeturn0search0turn0search1turn0search2turn10search16turn10search17turn16search4

## Методология глубокого исследования

Базовая логика ветки: сначала фиксировать, **какое решение должно поддержать исследование**, потом строить корпус, потом схему проверки, и только после этого — синтез. PRISMA, Cochrane и JBI сходятся в том, что сильное исследование начинается с прозрачного протокола, поисковой стратегии, критериев отбора и документируемой процедуры извлечения данных. citeturn0search0turn0search1turn0search2turn0search13

- **Постановка исследовательского вопроса**
  - Что входит: объект; decision use case; кто принимает решение; что считается полезным ответом; горизонт времени; география; уровень детализации.
  - Что исследовать глубже: типы вопросов — explanatory, evaluative, exploratory, competitive, predictive, due-diligence, trend-sensing.
  - Ключевые вопросы: что именно нужно выяснить; что меняет решение; что будет считаться достаточным доказательством.
  - Методы: problem framing; stakeholder interview; decision tree; assumption logging.
  - Инструменты: issue tree; assumption register; research brief template.
  - Риски: вопрос слишком широкий; вопрос не связан с решением; вопрос подменён curiosity-запросом.
  - Выходные артефакты: research brief; decision memo; list of primary questions.
  - Потенциальный deep research-промпт: «Построй методологию формулировки исследовательского вопроса для complex business/tech research с примерами good/bad framing».

- **Декомпозиция темы**
  - Что входит: main question → subquestions → units of evidence → unknowns → hypotheses.
  - Что исследовать глубже: логика декомпозиции по причинности, рынку, игрокам, каналам, технологиям, доказательствам, рискам.
  - Ключевые вопросы: какие подзадачи независимы; какие требуют общих данных; какие можно исследовать параллельно.
  - Методы: issue tree; MECE where useful; question lattice; dependency mapping.
  - Инструменты: mind map; whiteboard; graph database / notes system.
  - Риски: пропущенные подветки; пересекающиеся подветки; перегруженная карта.
  - Выходные артефакты: question tree; dependency map; hypothesis map.
  - Потенциальный deep research-промпт: «Разработай систему декомпозиции сложной исследовательской темы в 5–7 уровней глубины».

- **Тип исследования**
  - Что входит: scoping review; systematic review; competitive intelligence; market scan; expert review; landscape map; living review.
  - Что исследовать глубже: когда нужен exhaustive корпус, а когда достаточно target-rich sampling.
  - Ключевые вопросы: нужен ли полный охват; нужна ли реплицируемость; нужна ли количественная оценка силы доказательств.
  - Методы: study design selection; evidence-intent matching.
  - Инструменты: protocol canvas; review type selector.
  - Риски: попытка делать systematic review там, где нужен speed scan; или наоборот.
  - Выходные артефакты: selected review design; inclusion logic.
  - Потенциальный deep research-промпт: «Сравни типы deep research workflows: scoping, systematic, competitor, trend, due diligence».

- **Границы исследования**
  - Что входит: time window; geography; language; source classes; entity boundaries; exclusion logic.
  - Что исследовать глубже: как границы меняют выводы; где проходит useful cutoff.
  - Ключевые вопросы: что мы сознательно не берем; где есть blind spots; какие рынки/языки критичны.
  - Методы: scope memo; boundary testing; edge-case review.
  - Инструменты: inclusion/exclusion matrix.
  - Риски: scope creep; источниковая перегрузка; скрытый англоязычный bias.
  - Выходные артефакты: scope statement; non-goals list.
  - Потенциальный deep research-промпт: «Разработай систему постановки границ исследования для международных и мультиканальных тем».

- **Поисковая архитектура**
  - Что входит: query families; seed sources; backward/forward citation chasing; grey literature; reference-list harvesting; org/document search.
  - Что исследовать глубже: layered search; query evolution; recall vs precision; search saturation.
  - Ключевые вопросы: какие запросы покрывают core corpus; где искать непрямые сигналы; как фиксировать search drift.
  - Методы: search strings; snowballing; citation chasing; source stratification.
  - Инструменты: web search; scholarly indexes; saved searches; reference tracking. PRISMA и Cochrane прямо требуют прозрачного описания поиска, документации процессов отбора и работы с grey literature/reference lists. citeturn0search0turn0search1turn0search9turn17search12
  - Риски: search bias; overfitting под одну формулировку; потеря нестандартной терминологии.
  - Выходные артефакты: search protocol; query bank; seed corpus.
  - Потенциальный deep research-промпт: «Построй поисковую архитектуру для сложной темы с open, grey и hard-to-find sources».

- **Критерии включения и исключения**
  - Что входит: relevance; source type; methodological quality; recency; language; corporate affiliation; data completeness.
  - Что исследовать глубже: hard exclusion vs soft weighting.
  - Ключевые вопросы: что считается admissible evidence; где порог качества; что делать с противоречивыми, но значимыми источниками.
  - Методы: eligibility criteria; evidence weighting.
  - Инструменты: screening codebook.
  - Риски: post-hoc подгонка критериев; bias в пользу удобных источников.
  - Выходные артефакты: inclusion/exclusion sheet; adjudication rules.
  - Потенциальный deep research-промпт: «Создай критерии включения/исключения для multi-source business and technology research».

- **Скрининг и отбор**
  - Что входит: title/abstract screening; full-text screening; duplicate handling; conflict resolution.
  - Что исследовать глубже: semi-automated screening; two-pass review; adjudication logic.
  - Ключевые вопросы: как быстро сократить шум; как не потерять high-value outliers.
  - Методы: relevance coding; blind review; conflict reconciliation.
  - Инструменты: screening platforms; reference managers; AI-assisted prioritization.
  - Риски: early lock-in; подтверждающий bias; переоценка AI-реранкинга.
  - Выходные артефакты: screened corpus; reasons-for-exclusion log.
  - Потенциальный deep research-промпт: «Разработай screening workflow для corpus из 5k+ источников».

- **Схема извлечения данных**
  - Что входит: fields; entities; claims; metrics; methods; evidence type; caveats; conflict notes.
  - Что исследовать глубже: extraction schema для qual, quant, market, competitor, regulatory и scientific research.
  - Ключевые вопросы: какие поля нужны для будущего синтеза; что считать атомарным observation.
  - Методы: data extraction form; coding schema; ontology mapping.
  - Инструменты: review software; spreadsheets; databases; note systems.
  - Риски: избыточные поля; неструктурированные заметки; несопоставимые extraction units.
  - Выходные артефакты: extraction template; coded evidence table.
  - Потенциальный deep research-промпт: «Построй extraction schema для deep research, пригодную для сравнения разнородных источников».

- **Оценка качества, bias и conflicts**
  - Что входит: source authority; methodology quality; funding/conflicts; missing data; publication bias; survivorship bias.
  - Что исследовать глубже: перенос медицинских evidence tools в business/tech research.
  - Ключевые вопросы: насколько можно доверять источнику; что искажает вывод; какой уровень неопределенности допустим.
  - Методы: bias domains; quality scoring; confidence tiers.
  - Инструменты: risk-of-bias frameworks; confidence rubrics. Cochrane использует RoB 2 и смежные инструменты для оценки риска систематической ошибки, а GRADE — для оценки уверенности в совокупном корпусе доказательств. citeturn10search1turn10search5turn10search10turn10search16turn10search20
  - Риски: faux-precision; «все источники равны»; отсутствие отдельной оценки для каждого ключевого вывода.
  - Выходные артефакты: evidence quality matrix; confidence scoring sheet.
  - Потенциальный deep research-промпт: «Как адаптировать risk-of-bias и confidence scoring для non-academic deep research».

- **Модель синтеза**
  - Что входит: thematic synthesis; evidence matrix; contradiction map; scenario synthesis; implications layer.
  - Что исследовать глубже: когда делать narrative synthesis, когда comparative grid, когда evidence-gap map, когда living knowledge base.
  - Ключевые вопросы: как соединять disparate evidence; как не терять исключения; как показывать uncertainty.
  - Методы: thematic coding; claim clustering; contradiction analysis; evidence-gap mapping.
  - Инструменты: matrix views; graph maps; dashboards; report templates. Evidence gap maps выделяются как отдельный систематический продукт для обзора корпуса и фиксации лакун. citeturn10search2turn10search6turn10search10turn10search22
  - Риски: summary without synthesis; чрезмерная уверенность; игнорирование minority but strong evidence.
  - Выходные артефакты: evidence matrix; contradiction matrix; synthesis memo; executive brief.
  - Потенциальный deep research-промпт: «Сравни модели синтеза для глубоких исследований и покажи, когда какую использовать».

## Инструменты глубокого исследования

Эта ветка — не каталог софта, а карта ролей в системе: discovery, collection, organization, screening, extraction, verification, synthesis, refresh. На практике сильный стек обычно комбинирует библиографическую инфраструктуру, AI-assisted retrieval, review software, data-cleaning слой и архивирование источников. citeturn1search4turn1search17turn1search2turn1search7turn18search0turn18search1turn11search3turn19search7

- **Web discovery**
  - Что входит: search operators; domain targeting; news search; site search; advanced query iteration.
  - Что исследовать глубже: поисковые режимы для fast scan, evidence hunt, expert hunt, source hunt.
  - Ключевые вопросы: где искать первоисточник; как отличать commentary от source-of-record.
  - Методы: layered search; source-first search; query families.
  - Инструменты: search engines; custom search alerts.
  - Риски: search engine bias; personalization; fragile recency.
  - Выходные артефакты: query bank; search recipes.
  - Потенциальный deep research-промпт: «Построй продвинутый web-discovery workflow для аналитика, работающего с любыми темами».

- **Школьная и академическая поисковая инфраструктура**
  - Что входит: paper metadata; author graphs; citations; affiliations; subject hierarchies.
  - Что исследовать глубже: coverage differences; identifier resolution; API-first scholarly workflows.
  - Ключевые вопросы: где взять открытый метаслой; как собирать корпус программно.
  - Методы: API harvesting; bibliometric seeding; citation expansion.
  - Инструменты: Zotero для коллекций/тегов/аннотаций; OpenAlex API; entity["organization","Crossref","doi metadata agency"] REST API; Semantic Scholar API; arXiv API. citeturn1search0turn1search1turn1search2turn1search3turn8search2turn8search21
  - Риски: различия в coverage; дубликаты DOI; missing affiliations; lag по индексированию.
  - Выходные артефакты: machine-readable corpus; citation graph; author/institution map.
  - Потенциальный deep research-промпт: «Сравни открытые scholarly APIs для построения собственного research corpus».

- **Reference management**
  - Что входит: import; metadata cleanup; tags; notes; attachments; shared libraries.
  - Что исследовать глубже: структура reference library под large-scale projects.
  - Ключевые вопросы: как стандартизировать naming; как связать цитаты, теги и evidence extraction.
  - Методы: taxonomy design; note conventions; folder architecture.
  - Инструменты: Zotero; citation styles; shared libraries. citeturn1search4turn1search12
  - Риски: ручной хаос; inconsistent tags; потеря linked notes.
  - Выходные артефакты: governed source library; clean bibliography.
  - Потенциальный deep research-промпт: «Спроектируй reference-management систему для team-based deep research».

- **AI research assistants**
  - Что входит: query expansion; first-pass summarization; claim extraction; clustering; question answering over sources.
  - Что исследовать глубже: grounded AI vs browsing AI vs notebook AI vs literature AI.
  - Ключевые вопросы: где AI ускоряет; где его нельзя считать source of truth.
  - Методы: AI-as-copilot; source-grounded prompting; verification loop.
  - Инструменты: Elicit; Scite; Consensus; NotebookLM. Elicit позиционируется как инструмент для поиска, суммаризации и extraction по 125M+ papers; Scite — как слой Smart Citations; Consensus — как academic search engine с cited syntheses; NotebookLM — как source-grounded notebook с inline citations. citeturn2search0turn2search1turn2search2turn3search4turn3search7turn3search9
  - Риски: hallucinations; synthetic consensus; loss of nuance; dependency on tool coverage.
  - Выходные артефакты: accelerated briefs; candidate evidence tables; question packs.
  - Потенциальный deep research-промпт: «Построй human-in-the-loop protocol использования AI research assistants без потери проверяемости».

- **Citation mapping и literature discovery**
  - Что входит: backward/forward search; neighborhood discovery; seed expansion; trend following.
  - Что исследовать глубже: graph-based exploration vs keyword search.
  - Ключевые вопросы: как быстро увидеть field structure; как найти foundational и adjacent papers.
  - Методы: citation chaining; seed graphing; network exploration.
  - Инструменты: Connected Papers; Litmaps; ResearchRabbit; Citation Gecko. citeturn14search0turn14search1turn14search2turn14search3turn14search16
  - Риски: graph myopia; overreliance on citation popularity; undercoverage of newest work.
  - Выходные артефакты: literature landscape map; follow-up source queue.
  - Потенциальный deep research-промпт: «Сравни citation-mapping инструменты и выстрой лучший workflow discovery → monitoring».

- **Review management platforms**
  - Что входит: screening; dedupe; full-text review; extraction; collaboration; adjudication.
  - Что исследовать глубже: когда нужен dedicated review software, а когда хватает spreadsheets.
  - Ключевые вопросы: в какой момент проект перестает влезать в ручной workflow.
  - Методы: structured screening; dual review; extraction workflow.
  - Инструменты: Covidence; Rayyan; EPPI-Reviewer; CADIMA. citeturn18search0turn18search1turn18search2turn18search3turn18search20
  - Риски: tool lock-in; learning curve; лишняя тяжеловесность для small projects.
  - Выходные артефакты: reviewed corpus; screening log; extraction tables.
  - Потенциальный deep research-промпт: «Как выбрать review-management platform под размер, тип и воспроизводимость исследования».

- **Capture, clipping, archiving**
  - Что входит: сохранение веб-страниц; snapshotting; quotation capture; source permanence.
  - Что исследовать глубже: anti-link-rot strategy; archive discipline.
  - Ключевые вопросы: как доказать, что источник существовал в конкретном виде; как работать с исчезающими страницами.
  - Методы: snapshot-at-capture; source hashing; archive linking.
  - Инструменты: Wayback Machine; Save Page Now; local PDF/archive folders. citeturn7search3turn19search7
  - Риски: динамические страницы; paywalled content; robots restrictions.
  - Выходные артефакты: archived source pack; evidence attachments.
  - Потенциальный deep research-промпт: «Собери устойчивый архивационный слой для исследований с уязвимыми web sources».

- **Data cleaning и normalization**
  - Что входит: dedupe; entity normalization; date normalization; source typing; taxonomy cleanup.
  - Что исследовать глубже: normal forms for research evidence.
  - Ключевые вопросы: как сделать разнородный корпус сравнимым.
  - Методы: normalization pipelines; controlled vocabularies; reconciliation.
  - Инструменты: OpenRefine; spreadsheets; database constraints. citeturn11search3turn11search9turn11search19
  - Риски: silent merge errors; broken IDs; inconsistent entity naming.
  - Выходные артефакты: canonicalized dataset; entity dictionary.
  - Потенциальный deep research-промпт: «Разработай data-cleaning workflow для evidence tables и source registries».

- **Аналитические и кодовые среды**
  - Что входит: reproducible scripts; notebooks; APIs; parsers; scoring.
  - Что исследовать глубже: low-code vs code-first research automation.
  - Ключевые вопросы: что автоматизировать; где нужен audit trail.
  - Методы: notebook-first analysis; scriptable ETL; API logging.
  - Инструменты: notebooks; scripts; version control.
  - Риски: black-box scripts; irreproducible manual transformations.
  - Выходные артефакты: reusable scripts; parsers; scoring notebooks.
  - Потенциальный deep research-промпт: «Построй code-first deep research stack для repeatable analysis».

- **Knowledge base и collaboration layer**
  - Что входит: research memory; decision log; glossary; evidence cards; review comments; handoff.
  - Что исследовать глубже: personal vs team knowledge base.
  - Ключевые вопросы: как не терять контекст между исследованиями; как строить institutional memory.
  - Методы: note architecture; evidence cards; linked knowledge.
  - Инструменты: internal wiki; note systems; shared boards.
  - Риски: knowledge fragmentation; «отчет умер — знание умерло».
  - Выходные артефакты: evergreen research base; reusable playbooks.
  - Потенциальный deep research-промпт: «Спроектируй долговременную knowledge architecture для серийных deep research проектов».

## Обновление данных и автообновляемые пайплайны

Сильное исследование в 2026 году — это не только report, но и refreshable system. Для обновляемых исследований полезны saved searches, alerts, RSS/AI feeds, API harvesting, page-change detection, snapshotting, orchestration, lineage и ручные review gates. Для этого подходят механизмы типа Google Alerts, PubMed saved searches, arXiv OAI-PMH/API, Crossref Event Data, page monitoring и scheduler/orchestrator-стек вроде GitHub Actions, Airflow и Dagster. citeturn8search0turn8search8turn8search21turn8search6turn11search0turn11search1turn4search3turn4search0turn4search1

- **Классификация волатильности данных**
  - Что входит: static; slow-changing; event-driven; real-time; ephemeral.
  - Что исследовать глубже: refresh cadence by source volatility.
  - Ключевые вопросы: что нужно обновлять daily/weekly/monthly/on-change.
  - Методы: volatility scoring; refresh matrix.
  - Инструменты: source registry; SLA table.
  - Риски: over-refresh; stale critical inputs.
  - Выходные артефакты: update cadence matrix.
  - Потенциальный deep research-промпт: «Как классифицировать исследовательские источники по волатильности и назначать cadence».

- **Source registry**
  - Что входит: source owner; URL/API; access method; paywall status; cadence; credibility tier; schema.
  - Что исследовать глубже: registry design for teams and agents.
  - Ключевые вопросы: какие источники monitored, harvested, archived, manually reviewed.
  - Методы: source inventory; metadata governance.
  - Инструменты: registry database; spreadsheet; wiki.
  - Риски: orphan sources; undocumented dependencies.
  - Выходные артефакты: source registry; access ledger.
  - Потенциальный deep research-промпт: «Спроектируй source registry для auto-updating deep research system».

- **Saved searches и alert architecture**
  - Что входит: watcher queries; keyword variants; boolean logic; source-specific alerts.
  - Что исследовать глубже: alert templates for domains and entities.
  - Ключевые вопросы: как ловить signal without overwhelm.
  - Методы: alert narrowing; entity-specific watches; recency tuning.
  - Инструменты: Google Alerts; PubMed My NCBI saved searches; platform-native alerts. citeturn8search0turn8search8turn8search19
  - Риски: alert fatigue; poor recall; false positives.
  - Выходные артефакты: alert set; watchlist.
  - Потенциальный deep research-промпт: «Построй систему alerts для continuous monitoring по теме/бренду/рынку».

- **Feed-based monitoring**
  - Что входит: RSS; AI-prioritized feeds; newsletters; topic models.
  - Что исследовать глубже: feed curation for market and topic intelligence.
  - Ключевые вопросы: как фильтровать шум до чтения.
  - Методы: source curation; mute filters; AI feed design.
  - Инструменты: Feedly и Feedly AI. Feedly позиционируется как слой для отслеживания тем и трендов, а Feedly AI — как набор моделей для research/intelligence и noise reduction. citeturn11search2turn12search0turn12search6turn12search17
  - Риски: feed bias; hidden model logic; overfitting under mute filters.
  - Выходные артефакты: curated intelligence feed; topic channels.
  - Потенциальный deep research-промпт: «Собери feed-based intelligence workflow для deep research команды».

- **Page-change detection**
  - Что входит: monitoring of exact page blocks; pricing changes; policy updates; competitor pages; document updates.
  - Что исследовать глубже: DOM-level vs full-page monitoring.
  - Ключевые вопросы: что лучше отслеживать как page, section, keyword, DOM node.
  - Методы: change detection; snapshot diffing; escalation rules.
  - Инструменты: Visualping; Distill. citeturn11search0turn11search1turn11search5turn11search14
  - Риски: dynamic content noise; blocked checks; false diffs.
  - Выходные артефакты: monitored-page matrix; diff archive.
  - Потенциальный deep research-промпт: «Построй change-detection систему для мониторинга сайтов, PDF-страниц и product docs».

- **API harvesting**
  - Что входит: periodic pulls; pagination; snapshot diffs; entity enrichment.
  - Что исследовать глубже: low-friction ingestion for open datasets.
  - Ключевые вопросы: какие источники лучше брать через API, а не вручную.
  - Методы: ETL; incremental fetch; ID resolution.
  - Инструменты: OpenAlex API; Crossref REST/Event Data; Semantic Scholar API; arXiv API/OAI-PMH; openFDA. citeturn1search1turn1search2turn1search3turn8search6turn8search21turn13search3turn13search7
  - Риски: rate limits; schema drift; duplicate records.
  - Выходные артефакты: ingestion scripts; raw snapshots.
  - Потенциальный deep research-промпт: «Сравни API-first ingestion strategies для research pipelines».

- **Orchestration и scheduling**
  - Что входит: cron; dependencies; retries; notifications; run history.
  - Что исследовать глубже: single-user automation vs team orchestration.
  - Ключевые вопросы: когда хватает cron; когда нужен полноценный orchestrator.
  - Методы: DAG design; dependency scheduling; run monitoring.
  - Инструменты: entity["company","GitHub","software platform"] Actions schedule; Apache Airflow; Dagster; dbt как transformation layer. GitHub Actions поддерживает scheduled workflows по cron; Airflow — author/schedule/monitor workflows; Dagster — orchestration с lineage и observability. citeturn4search3turn4search7turn4search0turn4search4turn4search1turn4search6
  - Риски: fragile automations; silent failures; no observability.
  - Выходные артефакты: scheduled pipeline; ops dashboard.
  - Потенциальный deep research-промпт: «Спроектируй orchestrated auto-update pipeline для research knowledge base».

- **Normalization, dedupe и entity resolution**
  - Что входит: source merge; canonical entities; topic taxonomy; duplicate collapse.
  - Что исследовать глубже: cross-source canonicalization of companies/people/papers/topics.
  - Ключевые вопросы: как не раздваивать один объект в системе.
  - Методы: entity resolution; reconciliation; fuzzy matching with human validation.
  - Инструменты: OpenRefine; custom rules; ID registries. citeturn11search3turn11search9
  - Риски: wrongful merges; hidden ambiguity.
  - Выходные артефакты: entity dictionary; canonical graph.
  - Потенциальный deep research-промпт: «Как строить entity resolution для многоисточниковых исследовательских систем».

- **Versioning, snapshots и provenance**
  - Что входит: source snapshots; run logs; extraction versions; claim provenance.
  - Что исследовать глубже: provenance models for human+AI research.
  - Ключевые вопросы: можно ли воспроизвести каждый вывод до исходного фрагмента.
  - Методы: commit history; snapshot policies; provenance chains.
  - Инструменты: archive snapshots; source IDs; changelogs; source links.
  - Риски: orphan claims; citations without exact evidence; impossible rollback.
  - Выходные артефакты: provenance ledger; versioned evidence tables.
  - Потенциальный deep research-промпт: «Построй provenance layer для deep research от query до final synthesis».

- **Human-in-the-loop governance**
  - Что входит: manual review gates; exception queues; escalation; QA checklist.
  - Что исследовать глубже: which stages can be safely automated.
  - Ключевые вопросы: где automation допустима, а где нужен reviewer.
  - Методы: review checkpoints; red-flag rules; approval workflows.
  - Инструменты: dashboards; tickets; annotations; review queues.
  - Риски: automation bias; unattended drift; stale bad assumptions.
  - Выходные артефакты: QA protocol; reviewer playbook.
  - Потенциальный deep research-промпт: «Определи manual review gates для auto-updating research pipelines».

## Закрытые, платные и труднодоступные источники

Эта ветка нужна, потому что глубокие исследования редко выигрываются только открытым вебом. Премиальные news databases, private-market data, web/app intelligence, regulatory filings, court records, patents, clinical registries, expert interviews и FOIA/record requests часто дают то, чего нет в открытом слое. Но цена доступа — лицензии, методологические ограничения, правовые рамки и неравномерное покрытие. citeturn5search0turn5search1turn5search2turn5search7turn6search0turn6search1turn6search3turn7search0turn7search1turn7search2

- **Платные news и media-intelligence базы**
  - Что входит: licensed news archives; transcripts; multilingual coverage; corporate mentions; executive tracking.
  - Что исследовать глубже: difference between open web news and premium archives.
  - Ключевые вопросы: когда premium archive критичен; как искать исторический контекст.
  - Методы: archive search; entity-based monitoring; source triangulation.
  - Инструменты: entity["company","Dow Jones","news and data company"] Factiva; entity["company","LexisNexis","information services company"] Nexis/Nexis+ AI. Factiva и Nexis дают платный доступ к глобальным архивам news/data с исследовательскими функциями. citeturn5search0turn5search8turn5search1turn5search21
  - Риски: licensing; opaque source lists; expensive seats.
  - Выходные артефакты: archive-backed timeline; media narrative map.
  - Потенциальный deep research-промпт: «Сравни premium news intelligence platforms для deep research».

- **Private market и company intelligence**
  - Что входит: funding rounds; firmographics; investors; deals; growth signals; private company profiles.
  - Что исследовать глубже: coverage/accuracy of private company databases.
  - Ключевые вопросы: какие источники лучше для PE/VC, corp dev и competitor mapping.
  - Методы: dataset comparison; entity reconciliation; funding timeline building.
  - Инструменты: entity["company","Crunchbase","private company data platform"]; entity["company","PitchBook","private markets data platform"]. citeturn5search7turn5search19turn6search0turn6search4
  - Риски: estimated fields; stale private data; model-derived predictions masquerading as facts.
  - Выходные артефакты: company intelligence sheets; funding maps.
  - Потенциальный deep research-промпт: «Сравни источники private company intelligence по покрытию, цене и достоверности».

- **Digital market intelligence**
  - Что входит: website traffic; app downloads; audience behavior; rankings; engagement; ad signals.
  - Что исследовать глубже: panel-based estimates vs direct analytics.
  - Ключевые вопросы: где directional data достаточно; где нельзя делать hard claims.
  - Методы: benchmark comparison; triangulation with public data.
  - Инструменты: entity["company","Similarweb","digital intelligence company"]; entity["company","Sensor Tower","app intelligence company"]. Similarweb и Sensor Tower прямо позиционируют свои продукты как intelligence/estimation platforms, а не first-party truth, поэтому их лучше трактовать как directional evidence. citeturn5search2turn5search10turn6search1turn6search9
  - Риски: model error; black-box estimation; overinterpretation.
  - Выходные артефакты: digital benchmark deck; market-share estimates with caveats.
  - Потенциальный deep research-промпт: «Как использовать web/app intelligence инструменты без ложной точности».

- **Commercial market research**
  - Что входит: category reports; consumer data; company profiles; country and industry reports.
  - Что исследовать глубже: when to buy reports vs build your own evidence stack.
  - Ключевые вопросы: где платный report дает speed advantage; где он слишком high-level.
  - Методы: report triangulation; methodology audit.
  - Инструменты: entity["company","Euromonitor International","market research company"]; Statista-like secondary datasets.
  - Риски: top-down generalization; repackaged public data; limited methodological transparency.
  - Выходные артефакты: category baseline; market context layer.
  - Потенциальный deep research-промпт: «Разбери value и limits коммерческих market-research баз для strategy research».

- **Court, legal и regulatory records**
  - Что входит: complaints; motions; filings; enforcement; agency records; hearings.
  - Что исследовать глубже: legal research as evidence layer for business and competitor work.
  - Ключевые вопросы: какие споры, санкции, investigations и constraints уже зафиксированы.
  - Методы: docket analysis; filing timeline; case extraction.
  - Инструменты: EDGAR и entity["organization","U.S. Securities and Exchange Commission","us securities regulator"] filings; PACER; agency portals. EDGAR дает free access к filings, PACER — к федеральным court records. citeturn7search0turn7search4turn7search14turn7search1turn7search5
  - Риски: access costs; procedural complexity; missing state/local coverage.
  - Выходные артефакты: litigation map; regulatory exposure memo.
  - Потенциальный deep research-промпт: «Построй legal-regulatory research workflow для corporate and competitor intelligence».

- **Patents, clinical и regulated-domain registries**
  - Что входит: patent claims; application trends; trial registrations; FDA datasets; EU trials.
  - Что исследовать глубже: innovation signal extraction from regulatory/public registries.
  - Ключевые вопросы: как ловить early product movement, pipeline, IP strategy.
  - Методы: patent landscaping; trial tracking; adverse-event monitoring.
  - Инструменты: USPTO Patent Public Search; Google Patents; ClinicalTrials.gov; EU Clinical Trials; openFDA. citeturn13search1turn13search0turn13search2turn13search21turn13search3turn13search11
  - Риски: domain expertise required; filing lag; confusing legal/clinical terminology.
  - Выходные артефакты: patent landscape; clinical pipeline tracker.
  - Потенциальный deep research-промпт: «Собери методологию patent + clinical + regulatory intelligence для innovation research».

- **Government records by request**
  - Что входит: FOIA/public-record requests; archival collections; agency correspondence.
  - Что исследовать глубже: when requests outperform open search.
  - Ключевые вопросы: какие документы реально можно получить; сколько это занимает; как формулировать request narrowly.
  - Методы: records request drafting; agency targeting; response tracking.
  - Инструменты: FOIA.gov и agency-specific request systems. FOIA прямо рекомендует сначала проверить, не опубликованы ли данные уже публично, и указывает, что агентства не обязаны «проводить исследование» вместо заявителя. citeturn7search2turn7search10turn7search6
  - Риски: long latency; denials; partial disclosures; fees.
  - Выходные артефакты: records request pack; disclosure tracker.
  - Потенциальный deep research-промпт: «Разработай FOIA/public records strategy для сложного исследовательского запроса».

- **Expert networks и первичные интервью**
  - Что входит: one-on-one calls; transcripted interviews; surveys; expert panels.
  - Что исследовать глубже: integrating primary research into evidence stack.
  - Ключевые вопросы: кого интервьюировать; как верифицировать эксперта; как избегать MNPI/compliance issues.
  - Методы: interview guide; expert triangulation; structured debriefing.
  - Инструменты: GLG; AlphaSights; Guidepoint; Tegus/AlphaSense expert products. Эти платформы позиционируют себя как access layer к subject-matter experts и expert calls, а не как final truth layer. citeturn17search0turn17search5turn17search9turn17search10turn17search19turn17search7
  - Риски: anecdotal bias; compliance restrictions; expensive utilization.
  - Выходные артефакты: expert memo; interview matrix; signal log.
  - Потенциальный deep research-промпт: «Как встроить expert interviews в строгий deep research workflow».

- **Private communities и hard-to-capture discourse**
  - Что входит: industry Slack/Discord/forums; webinars; invite-only communities; conference Q&A; vendor ecosystems.
  - Что исследовать глубже: access ethics; capture protocols; forum credibility.
  - Ключевые вопросы: как отделять инсайт от шума; как фиксировать provenance приватного сигнала.
  - Методы: observation notes; anonymized evidence logging; community triangulation.
  - Инструменты: manual capture; note templates; archive discipline.
  - Риски: unverifiable claims; privacy issues; survivorship bias.
  - Выходные артефакты: discourse map; weak-signal tracker.
  - Потенциальный deep research-промпт: «Построй framework работы с private communities как источником weak signals».

- **Internal and client-owned corpora**
  - Что входит: CRM notes; support tickets; sales calls; internal docs; uploaded files; analytics exports.
  - Что исследовать глубже: how to merge internal truth with external evidence.
  - Ключевые вопросы: что можно считать source of record внутри организации; как связывать это с внешними источниками.
  - Методы: corpus auditing; permissioning; internal-external reconciliation.
  - Инструменты: internal search; document repositories; transcript tools.
  - Риски: confidentiality; stale docs; local bias.
  - Выходные артефакты: internal evidence layer; gap analysis between internal and external reality.
  - Потенциальный deep research-промпт: «Как интегрировать private internal knowledge в reproducible deep research систему».

## Проверка достоверности, перекрёстное сопоставление и синтез

Здесь ключевая идея простая: у хорошего deep research нет «просто источников», есть **цепочка доверия**. Для этого нужны source identity, lateral reading, версия документа, статус retraction/correction, независимое подтверждение чисел, media provenance и отдельный протокол верификации AI-выводов. Crossmark, Retraction Watch, SIFT/lateral reading, reverse image tools и C2PA полезны как специализированные слои этой цепочки. citeturn9search0turn9search17turn9search3turn15search0turn15search1turn15search2turn16search4

- **Проверка идентичности источника**
  - Что входит: кто автор; кто издатель; кто финансирует; какая institutional affiliation; первичный ли это источник.
  - Что исследовать глубже: source-of-record vs commentary layers.
  - Ключевые вопросы: кому принадлежит claim; где origin; кто реплицирует.
  - Методы: source ladder; publisher audit; author/entity trace.
  - Инструменты: publisher pages; metadata registries; legal/entity databases.
  - Риски: laundering through secondary summaries; fake authority.
  - Выходные артефакты: source authority scorecard.
  - Потенциальный deep research-промпт: «Разработай source-authority framework для multi-domain deep research».

- **Lateral reading**
  - Что входит: checking outside the page; looking up source reputation; comparing with independent references.
  - Что исследовать глубже: lateral verification under time pressure.
  - Ключевые вопросы: что говорят о самом источнике другие reliable sources.
  - Методы: SIFT; lateral reading; fast reputation checks.
  - Инструменты: search; fact-check tools; archive search. SIFT/lateral reading используется как практическая модель быстрой проверки цифровых источников. citeturn9search3turn9search7turn9search19
  - Риски: staying on the source page too long; non-independent corroboration.
  - Выходные артефакты: lateral check log.
  - Потенциальный deep research-промпт: «Собери профессиональный lateral-reading protocol для аналитиков и researchers».

- **Версионирование, corrections и retractions**
  - Что входит: версия записи; updated record; errata; corrigenda; retractions.
  - Что исследовать глубже: post-publication integrity monitoring.
  - Ключевые вопросы: не был ли источник исправлен, withdrawn или retracted.
  - Методы: retraction checks; version-aware citation; status checks.
  - Инструменты: Crossmark; Retraction Watch Database; publisher update policies. Crossmark показывает current status записи, а Retraction Watch ведет регулярно обновляемую базу retractions. citeturn9search0turn9search12turn9search5turn9search13turn9search17
  - Риски: outdated citations; dead but still circulating evidence.
  - Выходные артефакты: retraction/version flagging in corpus.
  - Потенциальный deep research-промпт: «Как встроить retraction and update monitoring в research pipeline».

- **Проверка чисел и метрик**
  - Что входит: denominator check; unit check; date check; estimate vs observed; sample vs population.
  - Что исследовать глубже: numeric reconciliation across incompatible reports.
  - Ключевые вопросы: что на самом деле измерялось; за какой период; чьи это данные.
  - Методы: source table comparison; metric normalization; denominator audit.
  - Инструменты: evidence tables; spreadsheets; notebooks.
  - Риски: apples-to-oranges comparison; reused stats without methodology.
  - Выходные артефакты: metric reconciliation sheet.
  - Потенциальный deep research-промпт: «Разработай систему numeric verification для market, product и science research».

- **Contradiction mapping**
  - Что входит: conflicting claims; incompatible methodologies; divergent timelines; disputed definitions.
  - Что исследовать глубже: how to synthesize disagreement without false certainty.
  - Ключевые вопросы: почему источники расходятся; disagreement substantive or definitional.
  - Методы: contradiction matrix; evidence weighting; scenario split.
  - Инструменты: claim tables; confidence scores.
  - Риски: flattening disagreement into bland average.
  - Выходные артефакты: contradiction matrix; explanation notes.
  - Потенциальный deep research-промпт: «Как строить contradiction-aware synthesis вместо усреднения источников».

- **Bias и conflict-of-interest analysis**
  - Что входит: funding bias; publication bias; selection bias; reporting bias; incentive analysis.
  - Что исследовать глубже: bias structures за пределами академической литературы.
  - Ключевые вопросы: кому выгоден конкретный вывод; какие данные могли не показать.
  - Методы: bias taxonomy; ownership analysis; disclosure review.
  - Инструменты: conflict logs; evidence scoring rubrics.
  - Риски: naive neutrality; ignoring incentives.
  - Выходные артефакты: bias map; source-risk flags.
  - Потенциальный deep research-промпт: «Адаптируй bias analysis из evidence synthesis к business and tech intelligence».

- **Media verification**
  - Что входит: reverse image search; fact-check lookup; provenance credentials; archive comparison.
  - Что исследовать глубже: verification of images, screenshots, videos, synthetic media.
  - Ключевые вопросы: где картинка впервые появилась; есть ли edit history; synthetic or authentic.
  - Методы: reverse search; provenance inspection; archive check.
  - Инструменты: TinEye; Google Fact Check Tools; C2PA / Content Credentials / Verify. TinEye предназначен для reverse image search, Fact Check Tools — для поиска уже проверенных claims/images, C2PA — для provenance metadata. citeturn15search0turn15search8turn15search1turn15search9turn15search2turn15search10
  - Риски: absent metadata ≠ fake; archival gaps; edited authentic media.
  - Выходные артефакты: media verification memo.
  - Потенциальный deep research-промпт: «Собери протокол верификации изображений, видео и скриншотов для deep research».

- **AI output verification**
  - Что входит: source grounding; citation validation; claim tracing; hallucination detection; confidence labeling.
  - Что исследовать глубже: safe use patterns for generative AI in evidence work.
  - Ключевые вопросы: какие AI-операции допустимы; что всегда требует human verification.
  - Методы: verify-every-claim; citation-first prompting; red-team prompts; spot checks.
  - Инструменты: grounded notebooks; evidence tables; link checking. NIST прямо рекомендует риск-ориентированное управление GenAI с учетом специфических рисков генеративных систем. citeturn16search4turn16search8turn16search9
  - Риски: fabricated citations; synthetic summaries without source support; automation bias.
  - Выходные артефакты: AI validation checklist; verified synthesis only.
  - Потенциальный deep research-промпт: «Разработай protocol безопасного использования LLMs в deep research».

- **Confidence scoring и uncertainty communication**
  - Что входит: high/medium/low confidence; certainty tiers; evidence gaps; unknowns.
  - Что исследовать глубже: communicating uncertainty for executives and operators.
  - Ключевые вопросы: насколько устойчив вывод; что могло бы его изменить.
  - Методы: confidence rubric; uncertainty statements; evidence gap noting.
  - Инструменты: GRADE-like scales; evidence gap maps. citeturn10search0turn10search4turn10search16turn10search22
  - Риски: pseudo-certainty; ambiguous caveats.
  - Выходные артефакты: confidence-tagged conclusions.
  - Потенциальный deep research-промпт: «Построй uncertainty and confidence language framework для аналитических отчетов».

- **Синтез в reusable knowledge objects**
  - Что входит: claim cards; evidence cards; decision memos; dashboards; living briefs; playbooks.
  - Что исследовать глубже: from one-off report to evergreen knowledge system.
  - Ключевые вопросы: в каком виде знание будет повторно использоваться.
  - Методы: modular synthesis; object-based reporting.
  - Инструменты: databases; notebooks; internal wiki.
  - Риски: report silo; wrong granularity; unusable archives.
  - Выходные артефакты: reusable research objects.
  - Потенциальный deep research-промпт: «Как превращать результаты deep research в обновляемые knowledge objects, а не разовые отчеты».

## Карта будущих отдельных исследований

Ниже — стартовый бэклог будущих deep research-запросов. Каждый пункт — отдельная ветка для самостоятельного углубления. Карта собрана так, чтобы можно было строить research OS по слоям: методология → tools → pipelines → hard sources → verification/synthesis. Опорные классы инструментов и источников в этом бэклоге уже имеют актуальные практические реализации: scholarly APIs, AI literature tools, alerts/monitoring, orchestration, premium archives, records systems и provenance tools. citeturn1search1turn2search0turn8search0turn11search0turn4search0turn5search0turn7search0turn15search2

- **Как формулировать research question для сложных тем**
  - Ветка: методология.
  - Ожидаемый результат: taxonomy research questions + templates.
  - Инструменты и источники: PRISMA/Cochrane/JBI; research brief examples.
  - Финальный артефакт: playbook + question templates.

- **Декомпозиция тем в issue trees и hypothesis maps**
  - Ветка: методология.
  - Ожидаемый результат: framework for decomposition.
  - Инструменты и источники: whiteboards; concept-mapping methods.
  - Финальный артефакт: decomposition canvas.

- **Как выбирать тип исследования под задачу**
  - Ветка: методология.
  - Ожидаемый результат: decision matrix review type ↔ decision context.
  - Инструменты и источники: Cochrane/JBI/Campbell materials.
  - Финальный артефакт: review-type selector.

- **Search architecture для deep research**
  - Ветка: методология.
  - Ожидаемый результат: layered search system.
  - Инструменты и источники: scholarly APIs; search operator guides; citation chasing.
  - Финальный артефакт: search playbook.

- **Как строить inclusion/exclusion criteria вне академии**
  - Ветка: методология.
  - Ожидаемый результат: adaptable eligibility framework.
  - Инструменты и источники: evidence synthesis guidance; business examples.
  - Финальный артефакт: screening rubric.

- **Data extraction schema для heterogeneous evidence**
  - Ветка: методология.
  - Ожидаемый результат: universal extraction template.
  - Инструменты и источники: Covidence/CADIMA/EPPI practices.
  - Финальный артефакт: extraction dictionary.

- **Bias analysis для business, tech и trend research**
  - Ветка: методология.
  - Ожидаемый результат: non-academic bias taxonomy.
  - Инструменты и источники: RoB/GRADE + applied intelligence methods.
  - Финальный артефакт: bias scoring framework.

- **Модели синтеза: narrative, matrix, contradiction, living**
  - Ветка: методология.
  - Ожидаемый результат: synthesis decision framework.
  - Инструменты и источники: evidence synthesis guidance; knowledge systems.
  - Финальный артефакт: synthesis mode selector.

- **Open scholarly infrastructure stack**
  - Ветка: инструменты.
  - Ожидаемый результат: comparison of OpenAlex, Crossref, Semantic Scholar, arXiv.
  - Инструменты и источники: official APIs and docs.
  - Финальный артефакт: API comparison matrix.

- **Reference management systems for large research projects**
  - Ветка: инструменты.
  - Ожидаемый результат: architecture for source libraries.
  - Инструменты и источники: Zotero plus note systems.
  - Финальный артефакт: reference SOP.

- **AI literature and research assistants**
  - Ветка: инструменты.
  - Ожидаемый результат: safe-use comparison of Elicit, Scite, Consensus, NotebookLM.
  - Инструменты и источники: official product docs; evaluation criteria.
  - Финальный артефакт: tool selection framework.

- **Citation mapping workflows**
  - Ветка: инструменты.
  - Ожидаемый результат: best-practice workflow for graph exploration.
  - Инструменты и источники: Connected Papers; Litmaps; ResearchRabbit; Citation Gecko.
  - Финальный артефакт: literature discovery playbook.

- **Review-management software comparison**
  - Ветка: инструменты.
  - Ожидаемый результат: compare Covidence, Rayyan, EPPI-Reviewer, CADIMA.
  - Инструменты и источники: official product capabilities; user criteria.
  - Финальный артефакт: decision matrix.

- **Source archiving and anti-link-rot workflow**
  - Ветка: инструменты.
  - Ожидаемый результат: stable citation and snapshot strategy.
  - Инструменты и источники: Wayback; archive practices.
  - Финальный артефакт: archival SOP.

- **Data cleaning for evidence tables**
  - Ветка: инструменты.
  - Ожидаемый результат: normalization playbook.
  - Инструменты и источники: OpenRefine; entity resolution methods.
  - Финальный артефакт: cleaning checklist + templates.

- **Research knowledge base design**
  - Ветка: инструменты.
  - Ожидаемый результат: architecture for long-term research memory.
  - Инструменты и источники: wiki/note/database patterns.
  - Финальный артефакт: knowledge schema.

- **Volatility scoring for source cadences**
  - Ветка: обновление данных.
  - Ожидаемый результат: refresh policy model.
  - Инструменты и источники: source registries; cadence frameworks.
  - Финальный артефакт: update cadence matrix.

- **Alert systems for continuous monitoring**
  - Ветка: обновление данных.
  - Ожидаемый результат: alert-stack by domain and objective.
  - Инструменты и источники: Google Alerts; PubMed; platform alerts.
  - Финальный артефакт: alert bank.

- **Feed-based intelligence systems**
  - Ветка: обновление данных.
  - Ожидаемый результат: noise-controlled topic monitoring setup.
  - Инструменты и источники: Feedly and similar tools.
  - Финальный артефакт: feed governance guide.

- **Page-change detection tactics**
  - Ветка: обновление данных.
  - Ожидаемый результат: exact workflow for competitor/policy/product-page monitoring.
  - Инструменты и источники: Visualping; Distill.
  - Финальный артефакт: monitoring cookbook.

- **API-first research ingestion**
  - Ветка: обновление данных.
  - Ожидаемый результат: API harvesting architecture.
  - Инструменты и источники: OpenAlex; Crossref; arXiv; openFDA; domain APIs.
  - Финальный артефакт: ingestion blueprint.

- **Research orchestration stack**
  - Ветка: обновление данных.
  - Ожидаемый результат: compare cron, GitHub Actions, Airflow, Dagster.
  - Инструменты и источники: official scheduler docs.
  - Финальный артефакт: orchestration decision tree.

- **Provenance and versioning layer**
  - Ветка: обновление данных.
  - Ожидаемый результат: claim-to-source traceability framework.
  - Инструменты и источники: archive tools; versioning patterns.
  - Финальный артефакт: provenance schema.

- **Premium news databases for investigators**
  - Ветка: закрытые источники.
  - Ожидаемый результат: comparison of Factiva and Nexis workflows.
  - Инструменты и источники: licensed archive platforms.
  - Финальный артефакт: premium archive playbook.

- **Private-company data stack**
  - Ветка: закрытые источники.
  - Ожидаемый результат: comparison of Crunchbase and PitchBook use cases.
  - Инструменты и источники: company data platforms.
  - Финальный артефакт: company intelligence matrix.

- **Digital estimation tools and their limits**
  - Ветка: закрытые источники.
  - Ожидаемый результат: methodology-aware usage guide for Similarweb and Sensor Tower.
  - Инструменты и источники: market-intelligence platforms.
  - Финальный артефакт: estimation caveat framework.

- **Legal and regulatory records research**
  - Ветка: закрытые источники.
  - Ожидаемый результат: workflow for filings, dockets, enforcement.
  - Инструменты и источники: EDGAR; PACER; agency portals.
  - Финальный артефакт: legal intelligence SOP.

- **Patent and clinical registry intelligence**
  - Ветка: закрытые источники.
  - Ожидаемый результат: early-signal workflow for regulated sectors.
  - Инструменты и источники: USPTO; Google Patents; ClinicalTrials.gov; EU CTR; openFDA.
  - Финальный артефакт: regulated-domain research playbook.

- **FOIA and records request strategy**
  - Ветка: закрытые источники.
  - Ожидаемый результат: request design and timing model.
  - Инструменты и источники: FOIA and agency guidance.
  - Финальный артефакт: request templates + tracking sheet.

- **Expert interview systems with compliance controls**
  - Ветка: закрытые источники.
  - Ожидаемый результат: protocol for expert conversations as evidence.
  - Инструменты и источники: expert networks; interview methods.
  - Финальный артефакт: compliant expert research protocol.

- **Source authority scoring**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: source-trust framework.
  - Инструменты и источники: source metadata; corporate/regulatory records.
  - Финальный артефакт: source scorecard.

- **Lateral reading for analysts**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: rapid verification method for digital sources.
  - Инструменты и источники: SIFT; search; fact-check tools.
  - Финальный артефакт: lateral-reading checklist.

- **Retraction, correction and update monitoring**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: version-aware evidence workflow.
  - Инструменты и источники: Crossmark; Retraction Watch; publisher policies.
  - Финальный артефакт: update-monitoring protocol.

- **Contradiction-aware synthesis**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: framework for writing with disagreement.
  - Инструменты и источники: evidence matrices; confidence scoring.
  - Финальный артефакт: contradiction matrix template.

- **AI verification protocol**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: safe operating model for generative AI in research.
  - Инструменты и источники: NIST GenAI guidance; grounded tools.
  - Финальный артефакт: AI QA SOP.

- **Media provenance and synthetic-content verification**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: protocol for images/video/screenshots.
  - Инструменты и источники: TinEye; Fact Check Tools; C2PA.
  - Финальный артефакт: media verification checklist.

- **Confidence language for executive research**
  - Ветка: проверка и синтез.
  - Ожидаемый результат: controlled vocabulary for certainty and risk.
  - Инструменты и источники: GRADE-like models; decision-memo practice.
  - Финальный артефакт: confidence style guide.

## Приоритизация и итог

Эта финальная ветка нужна не для теории, а для сборки рабочего research OS. Если запускать всё сразу, система ломается на complexity. Если запускать слоями — появляется воспроизводимость, traceability и накопление исследовательской памяти. Для старта критичны protocol-first методология, curated tool stack, refresh loop и verification gates. Риск-ориентированное использование AI и документируемая цепочка источников должны появиться в системе раньше, чем масштабирование automation. citeturn0search0turn0search1turn16search4turn9search0turn9search3

- **Обязательные для старта**
  - Как формулировать research question для сложных тем.
  - Декомпозиция тем в issue trees и hypothesis maps.
  - Search architecture для deep research.
  - Open scholarly infrastructure stack.
  - Reference management systems for large research projects.
  - Source authority scoring.
  - Lateral reading for analysts.
  - Data extraction schema для heterogeneous evidence.
  - Alert systems for continuous monitoring.
  - AI verification protocol.

- **Важные для продвинутой системы**
  - Как выбирать тип исследования под задачу.
  - Bias analysis для business, tech и trend research.
  - Citation mapping workflows.
  - Review-management software comparison.
  - Feed-based intelligence systems.
  - Page-change detection tactics.
  - API-first research ingestion.
  - Premium news databases for investigators.
  - Legal and regulatory records research.
  - Contradiction-aware synthesis.

- **Дополнительные для экспертного уровня**
  - Volatility scoring for source cadences.
  - Research orchestration stack.
  - Provenance and versioning layer.
  - Private-company data stack.
  - Digital estimation tools and their limits.
  - Patent and clinical registry intelligence.
  - FOIA and records request strategy.
  - Expert interview systems with compliance controls.
  - Retraction, correction and update monitoring.
  - Media provenance and synthetic-content verification.
  - Confidence language for executive research.
  - Research knowledge base design.

- **Краткая схема всей системы**
  - Layer A — framing: question; scope; decision use case.
  - Layer B — corpus: search; discovery; source registry; collection.
  - Layer C — structuring: screening; extraction; normalization; taxonomy.
  - Layer D — validation: source authority; lateral reading; retraction/provenance; media checks; AI QA.
  - Layer E — synthesis: evidence matrix; contradiction handling; confidence language; decision output.
  - Layer F — persistence: archive; versioning; monitoring; orchestration; knowledge base.
  - Layer G — scale: premium sources; expert interviews; internal corpora; living updates.

- **Какие исследования запускать первыми**
  - «Как формулировать research question для сложных тем».
  - «Search architecture для deep research».
  - «Reference management systems for large research projects».
  - «Source authority scoring».
  - «AI verification protocol».

- **Какие ветки лучше не трогать до появления базовой системы**
  - Сложную orchestration-автоматизацию на Airflow/Dagster без готового source registry и extraction schema.
  - Expensive premium databases без ясных use cases и decision owners.
  - Массовые expert interviews без compliance protocol и question design.
  - Living knowledge graph без нормализованной таксономии и entity resolution.
  - Автоматические executive digests без contradiction handling и confidence language.

- **Где чаще всего люди ошибаются при построении deep research workflow**
  - Начинают с инструментов, а не с decision use case.
  - Путают широкую поисковую активность с хорошей search architecture.
  - Не фиксируют inclusion/exclusion criteria до чтения корпуса.
  - Смешивают source material, notes, extracted claims и conclusions в одном слое.
  - Не различают source-of-record, secondary commentary и AI summary.
  - Не ведут retraction/correction/version tracking.
  - Используют AI как synthesizer без claim-by-claim verification.
  - Не нормализуют сущности, даты, метрики и определения.
  - Недооценивают link rot и исчезновение веб-источников.
  - Переходят к автообновлению раньше, чем выстроены provenance и QA.
  - Не кодируют uncertainty и выдают «ровный» вывод там, где корпус противоречив.
  - Делают один красивый отчет вместо накопительной системы знаний.