# June 5, 2026 — Dry Run Demo Analysis
## TP Mechanical | Salesforce Field Service Demo

**Demo Date:** June 5, 2026
**Customer:** Terry Vanecek, Service Director — TP Mechanical
**Salesforce Team:** Mike Knight (FSL SE), Connor Maio (Service Cloud SE), John Rozsits (Revenue Cloud SE), Keith Miccio (AE)
**SI Partner:** Rob Hansen

---

## Section A — What Worked Well (Keep These Moments)

### 1. AI Agent Phone Intake → Auto Case Creation
Connor demonstrated the AI agent handling an inbound phone call, automatically generating a case with populated subject and description.

**Terry's reaction:** *"Much nicer than what I'm used to seeing."*

**Why it matters:** TP Mechanical's current process involves dispatchers manually entering call details. The automated intake directly addresses their efficiency concern and shows immediate ROI.

**Keep because:** This is the strongest opening hook. It sets the tone that Salesforce does the heavy lifting.

---

### 2. Work Order Auto-Creation from Case
After case creation, the work order was automatically created with pre-populated fields (customer, asset, location, work type).

**Why it matters:** Terry's team loses time re-entering data across systems. This shows zero double-entry.

**Keep because:** Short, high-impact moment that lands with ops-focused buyers.

---

### 3. Scheduling Candidates + Book Appointment (Golden Slots)
Dispatcher view showing qualified technicians ranked by proximity/availability, with a "golden slot" recommendation that picks the optimal time slot for the customer.

**Why it matters:** TP Mechanical currently relies on dispatcher memory and manual scheduling. The golden slot concept resonates with their "get it right the first time" ethos.

**Keep because:** Terry was engaged here. Scheduling is core to FSL's value prop and differentiates from BuildOps.

---

### 4. Jeopardy Flag + Drag-and-Drop Reassignment
The jeopardy automation flag triggered when a service appointment ran late, alerting the dispatcher. The dispatcher then reassigned it via drag-and-drop on the Gantt chart.

**Terry's reaction:** *"That's a nice feature."*

**Why it matters:** Terry mentioned that today his dispatchers rely on memory and phone calls to manage exception events. Automated jeopardy flags eliminate that dependency.

**Keep because:** Strong differentiation. Easy to understand visually. Terry specifically called it out as something he liked.

---

### 5. Schedule Optimization (Fix Overlaps + Fill Schedules)
Demonstrated the one-click optimization that resolves schedule conflicts and fills gaps in technician schedules.

**Terry asked:** Is this included in the license? (Answer: Yes, included with FSL.)

**Keep because:** The license question means he's thinking about real-world adoption. This feature directly reduces dispatcher workload — a top concern.

---

### 6. Multi-Territory Gantt Chart View
Dispatcher console showing all service territories on a single Gantt, giving a regional view across multiple locations.

**Why it matters:** TP Mechanical has operations across multiple territories/regions. The consolidated view is an operational upgrade over their current IFS experience.

**Keep because:** Ties to their multi-OpCo structure and the CEO-level vision for standardized operations.

---

### 7. Revenue Cloud — Quote Templates, Approval Workflows, Document Generation
John demonstrated:
- Quote creation from a catalog template with cost-plus pricing
- Approval workflow triggered by deal size and margin thresholds
- Word document generation from quote (tokens-based template)

**Why it matters:** TP Mechanical's sales process is fragmented. Structured quoting with automated approvals addresses consistency and margin protection.

**Keep because:** The document generation moment is visually impactful — it turns a Salesforce record into a customer-ready proposal in seconds.

---

### 8. Service Contract Creation from Assets
Demonstrated generating a service contract from the customer's installed asset record, with contract terms, coverage, and SLA milestones auto-populated.

**Why it matters:** TP Mechanical's service contracts today are manually managed. Tying them to assets enables proactive service and renewal management.

**Keep because:** Connects the "installed base" story to recurring revenue — a key exec-level message.

---

### 9. Mobile — VRA + Agentforce + Service Documents + Signatures
Field technician mobile experience showing:
- Visual Remote Assistance (VRA) — live video support from an expert
- Agentforce embedded in the mobile app for contextual guidance
- Service documents with step-by-step work plans
- Customer signature capture on completion

**Why it matters:** TP Mechanical's techs currently use 250+ options on IFS work order forms. The streamlined mobile experience with embedded intelligence is a direct counter to that complexity.

**Keep because:** The VRA moment is always a crowd-pleaser. Agentforce in the field is a strong differentiator vs. BuildOps.

---

### 10. Automated Notifications (Customer + Internal)
Automated customer notifications when a technician is dispatched, en route, and on-site. No dispatcher manual action required.

**Why it matters:** Today TP Mechanical relies on dispatchers to remember to call customers. Automation eliminates missed communications.

**Keep because:** Simple, tangible, immediately relatable to any service operation.

---

## Section B — Areas for Improvement

### 1. UI Complexity Concern — #1 Priority to Address
**What happened:** Terry's biggest worry coming in was that his team would see Salesforce as "too complicated." He specifically called out the service console having too many widgets on screen.

**Rob Hansen (SI Partner) agreed:** The adoption concern is real and often comes up. He suggested showing a simplified view alongside the full admin view.

**Improvement needed:**
- Add a "before/after" moment to the demo: show the full admin/setup view briefly, then switch to a **simplified dispatcher page layout** with only the 4-5 most-used components visible.
- Frame it: *"This is what your dispatchers see — we configure the system to show only what each role needs."*
- Consider a dedicated slide or demo step that explicitly names IFS's 250+ form fields as the problem, and positions the Salesforce layout builder as the solution.

---

### 2. Next Best Action Upsell — Needs Reframing
**What happened:** The NBA prompt during the work order flow surfaced a upsell recommendation ("customer may be interested in a maintenance contract"). It didn't land with Terry — dispatchers aren't sales-minded and the framing felt misaligned.

**Terry's redirect:** *"Flag it for the tech"* — he wants the field technician to handle upsell conversations, not the dispatcher.

**Improvement needed:**
- Reframe NBA prompts as **operational alerts**, not sales prompts. Examples:
  - "This asset is out of warranty — consider quoting a service contract while on site."
  - "Customer has 2 open cases in the last 30 days — check if related."
  - "Technician is 20 minutes from the next job — confirm the customer will be on site."
- For the upsell story, move it to the **mobile app context** where the tech sees it, not the dispatcher.

---

### 3. German Knowledge Articles Showing Up — Demo Data Cleanup
**What happened:** During the demo, German-language knowledge articles appeared on the work type (artifact of the quick setup process).

**Fix needed before next demo:** Remove or filter German knowledge articles from the demo org. These are SDO quick setup artifacts and should not appear in a TP Mechanical-branded scenario.

---

### 4. Work Order Collaboration — Unclear in Demo
**What happened:** Terry mentioned he didn't clearly see how collaboration on work orders was handled — specifically the ability for multiple people (dispatcher, tech, service manager) to communicate in-context.

**Improvement needed:**
- Add a brief demonstration of Chatter on the work order record or case — show a dispatcher tagging a service manager with a question, and the response thread staying attached to the record.
- Alternatively, show the notification/feed activity from the automated jeopardy reassignment as a collaboration artifact.

---

### 5. Asset Install Base — Set Expectations
**What happened:** The demo used pre-built asset records (York chiller, Carrier unit, Daikin unit). Terry confirmed that TP Mechanical **does not have good asset records today** — they're largely untracked.

**How to handle in demo:**
- Acknowledge this explicitly: *"We know you're building the asset registry — Salesforce is designed for this. You can start simple and add detail over time. Many customers start with just account + equipment type and enrich from there."*
- Show the asset import or quick-add flow briefly if possible.
- Avoid implying the asset-rich demo experience requires a complete dataset on day one.

---

### 6. Quote Creation from Mobile — Terry Explicitly Requested This
**What happened:** Terry mentioned that his team "lost the ability to do" quote creation from the field when they moved to their current platform.

**Terry's exact ask:** Show quote creation from the mobile app in the broader team demo.

**Improvement needed:**
- Add a mobile quoting step to Scene 5 (Mobile App) in the runbook.
- Show the technician finding a potential upsell opportunity on site, creating a quote from the mobile app using catalog templates, and having it route for approval automatically.
- This is a **must-have moment** for the broader team demo — Terry specifically called it out.

---

## Section C — Competitive Intel (From Transcript)

### BuildOps
- Doing an on-site demo in Texas.
- Terry's assessment: *"They're nervous they're not going to be a player going forward. They're showing what they're going to be doing in the future, not what they're able to do today."*
- Terry is not impressed by their forward roadmap. He wants to see working product today.
- **Counter in demo:** Lean into Salesforce's production-ready capabilities. Avoid vaporware claims. Every capability shown should be live in the demo org.

### XOI (AI Bolt-On)
- Some TP Mechanical OpCos are asking about XOI as an AI add-on to their current platform.
- Terry is skeptical: *"That's one more thing to put in place."*
- **Counter in demo:** Agentforce is native to the platform — not a bolt-on. No separate vendor, no separate contract, no integration complexity.

### IFS (Current Platform)
- TP Mechanical's current system.
- Key pain point: 250+ options/fields on work orders — information overload for techs.
- **Counter in demo:** The FSL mobile app and role-based page layouts directly address this. Use IFS's complexity as the foil.

---

## Section D — Timeline & Next Steps

Based on the June 5 transcript, Terry's decision timeline:

| Milestone | Approximate Timing |
|---|---|
| Consultant report completed | ~June 12, 2026 |
| Meeting with CEO Derek (future state of service) | Following the consultant report |
| Narrow to 2 vendors | Within ~2 weeks of June 5 |
| Terry's vacation | Last week of June 2026 |
| Virtual demo with broader team | Before or after vacation (TBD with Keith) |
| On-site demo | Following virtual |

**Key implication:** The broader team demo (the one this runbook supports) needs to be scheduled and delivered **before or immediately after** Terry returns from vacation. The June 23 internal dry run is the prep for that. Mobile quoting, simplified UI view, and reframed NBA prompts are the three highest-priority changes before that demo.

---

## Quick Summary for Demo Prep

| Priority | Action | Owner |
|---|---|---|
| P1 | Add simplified page layout "before/after" to scene | Mike K |
| P1 | Add mobile quote creation to Scene 5 | Mike K |
| P1 | Remove German knowledge articles from demo org | Mike K |
| P2 | Reframe NBA prompts to operational language | Connor / Mike K |
| P2 | Add work order collaboration (Chatter) step | Connor |
| P3 | Add asset install base caveat to script | Mike K |
| P3 | Sharpen competitive counter-positioning | Keith |
