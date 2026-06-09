# Fechou. — Pare de enviar orçamentos. Comece a fechar negócios.

> SaaS de fechamento de vendas para prestadores de serviço. Transforma orçamentos
> mortos em PDF/WhatsApp em **links vivos** que rastreiam leitura, avisam no momento
> exato em que o cliente está olhando e fecham com aceite digital + sinal via Pix.

**Site de vendas completo:** [`index.html`](index.html) — zero dependências, zero build.
Suba na Vercel, Netlify ou GitHub Pages e está no ar.

---

## 1. O problema real

No Brasil existem **mais de 25 milhões de trabalhadores autônomos e MEIs** que vendem
serviço por orçamento: eletricistas, arquitetos, designers, fotógrafos, marceneiros,
agências de 1 pessoa, personal trainers, buffets, técnicos de ar-condicionado.

O fluxo de venda deles é sempre o mesmo — e sempre quebra no mesmo lugar:

1. Cliente pede orçamento pelo WhatsApp.
2. Profissional gasta 40 minutos montando um PDF ou texto.
3. Envia. O cliente visualiza. **E some.**
4. O profissional não sabe se foi o preço, se o cliente nem leu, ou se fechou com outro.
5. Fazer follow-up dá vergonha ("vou parecer desesperado") — então ninguém faz.

Pesquisas de vendas mostram que **~78% dos orçamentos enviados nunca recebem resposta**,
e que **80% das vendas exigem 5+ follow-ups**, mas **44% dos vendedores desistem após o
primeiro**. O dinheiro não está sendo perdido na captação de clientes — está sendo
perdido **depois** que o cliente já pediu o preço.

Ninguém ataca esse momento. CRMs são complexos demais para quem trabalha sozinho.
Ferramentas de proposta (Proposify, PandaDoc) são caras, em inglês, focadas em PDF
corporativo e não falam WhatsApp nem Pix.

## 2. A solução: o orçamento que se vende sozinho

O **Fechou.** substitui o PDF por um **link inteligente de proposta**:

| Momento | O que o Fechou faz |
|---|---|
| Cliente abre o link | Profissional recebe alerta no WhatsApp: **"🔥 Carlos está vendo sua proposta AGORA — 2ª vez hoje. Liga pra ele."** |
| Cliente lê e some | **Radar de Follow-up**: sequência automática de mensagens humanizadas (com o tom do profissional, não de robô) nos dias 2, 5 e 9 — os momentos com maior taxa de resposta. |
| Cliente hesita | A proposta tem **validade com contagem regressiva** e o preço pode expirar — urgência real, sem o profissional precisar pressionar. |
| Cliente decide | **Aceite com 1 toque + assinatura digital + sinal via Pix** dentro da própria proposta. O "sim" vira dinheiro no mesmo minuto, antes de o cliente esfriar. |
| Sempre | **Termômetro da proposta**: quantas vezes abriu, quanto tempo passou em cada seção, se parou na parte do preço. O profissional liga sabendo exatamente o que travou. |

### Por que isso não é "mais do mesmo"

- **Não é CRM** — não pede cadastro de pipeline, etapas, tags. O profissional só cria a proposta e o produto trabalha.
- **Não é chatbot** — não conversa com o cliente do profissional; ele arma o profissional com timing e contexto.
- **Não é gerador de PDF** — o PDF é exatamente o formato que mata a venda (estático, mudo, sem dados).
- A unidade do produto não é "o contato" nem "o documento": é **o momento de fechamento**.

## 3. Modelo de negócio

SaaS de assinatura mensal com freemium agressivo (o plano grátis é o canal de aquisição —
cada proposta enviada carrega "feito com Fechou." e vira marketing viral B2B):

| Plano | Preço | Para quem |
|---|---|---|
| **Grátis** | R$ 0 | 5 propostas/mês, alertas de abertura. Porta de entrada. |
| **Profissional** | R$ 49/mês (R$ 39 no anual) | Propostas ilimitadas, Radar de Follow-up, Termômetro, aceite + Pix, sua marca (sem selo Fechou). |
| **Equipe** | R$ 129/mês | Até 5 usuários, modelos compartilhados, relatório de taxa de fechamento por pessoa. |

Receita complementar futura: 0,99% sobre sinais recebidos via Pix (opcional, estilo Stripe).

**Unit economics de solo founder:** custo marginal por usuário ≈ R$ 0 (links estáticos +
webhooks). 300 assinantes Pro = ~R$ 14.700/mês de MRR. Aquisição por conteúdo
(Instagram/TikTok de "por que seu orçamento não responde") + o próprio selo viral.

## 4. Público-alvo

**Primário:** prestadores de serviço solo e micro (1–5 pessoas) que vendem por orçamento
de ticket entre R$ 300 e R$ 30.000 — arquitetos, designers, fotógrafos, marceneiros,
eletricistas, agências pequenas, organizadores de eventos.

**Gatilho de compra:** dor recente e nomeável ("me deixaram no vácuo de novo essa semana").
**Onde estão:** Instagram, grupos de WhatsApp de categoria, YouTube de nicho.

## 5. Como ganha dinheiro

1. **Assinatura mensal/anual** (núcleo) — o plano grátis limita volume, não valor.
2. **Upgrade por dor:** o usuário grátis recebe o alerta "sua proposta foi aberta 3x"
   mas o Radar de Follow-up automático é Pro — a conversão acontece no momento da dor.
3. **Take rate opcional no Pix** (fase 2).
4. **Anual com 20% off** para caixa antecipado.

## 6. Diferencial competitivo

1. **WhatsApp-native + Pix-native** — nenhuma ferramenta gringa de proposta fala a língua
   do mercado brasileiro de serviços.
2. **Foco no pós-envio**, o momento que CRMs ignoram e onde 78% do dinheiro morre.
3. **Setup de 3 minutos no celular** — o concorrente real (planilha + PDF + vergonha de
   cobrar) é derrotado por simplicidade, não por features.
4. **Loop viral embutido**: cada proposta grátis enviada é vista por um cliente que
   também é prestador de serviço em potencial.
5. **Dados proprietários**: com volume, o Fechou aprende *quando* e *como* fazer
   follow-up por nicho — uma vantagem composta que PDF nunca terá.

## 7. Branding

- **Nome:** Fechou. — a palavra que todo brasileiro usa quando o negócio é dado como certo. O ponto final é parte da marca: assunto encerrado, venda feita.
- **Logo conceitual:** um balão de mensagem cujo contorno se completa num check (✓) — a conversa que termina em venda. Monograma "F✓" em gradiente verde-menta → ciano sobre dark.
- **Slogan:** *"Pare de enviar orçamentos. Comece a fechar negócios."*
- **Cores:** fundo `#07070B` (quase-preto azulado), acento `#34F5A4 → #38BDF8` (verde-dinheiro → ciano-tech), texto `#E7E9EE`.
- **Tipografia:** Sora (display) + Inter (texto).
- **Tom de voz:** direto, cúmplice, sem corporativês. Fala com o profissional como um sócio que entende o vácuo do cliente.

## 8. Estrutura do produto (MVP de dev solo, ~4 semanas)

```
Semana 1  → Auth + criação de proposta (título, itens, preço, validade) + link público
Semana 2  → Tracking de abertura/tempo por seção + alerta via WhatsApp (API Meta ou Z-API)
Semana 3  → Radar de Follow-up (cron + templates) + aceite com assinatura simples
Semana 4  → Pix (Mercado Pago/Asaas) + planos com Stripe/Pagar.me + landing no ar
```

Stack sugerida: Next.js + Postgres (Supabase) + fila simples (cron) + 1 integração de
WhatsApp + 1 gateway Pix. Sem ML, sem infra pesada — tudo executável por uma pessoa.

## 9. Estrutura do site (`index.html`)

Hero de alto impacto com demo viva do alerta → prova social → o problema em números →
como funciona em 3 passos → demonstração do Termômetro → 6 benefícios → tabela
comparativa (PDF/WhatsApp puro × CRM × ferramentas gringas × Fechou) → depoimentos →
planos com toggle mensal/anual → FAQ → CTA final. Dark premium, mobile-first,
animações de scroll, sem nenhuma dependência externa além das fontes.
