package pl.meczykowska.stepslibrary.controllers;

import pl.meczykowska.stepslibrary.domain.Step;
import pl.meczykowska.stepslibrary.dto.SourceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.meczykowska.stepslibrary.domain.Source;
import pl.meczykowska.stepslibrary.SourceService;
import pl.meczykowska.stepslibrary.StepService;

import javax.validation.Valid;


@Controller
public class SourceController {

    @Autowired
    private SourceService sourceService;

    @Autowired
    private StepService stepService;

    @ModelAttribute("sourceDto")
    public SourceDTO createSourceDTO() {
        return new SourceDTO();
    }

    @RequestMapping(value = "/step-{id}/add-source", method = RequestMethod.GET)
    public String addStep(@PathVariable int id, Model model) {
        Step step = stepService.findStepById(id);
        model.addAttribute("step", step);
        model.addAttribute("sources", sourceService.findAllSourcesByStep(step));
        return "addSource";
    }

    @RequestMapping(value = "/step-{id}/add-source", method = RequestMethod.POST)
    public String sendSource(@PathVariable int id, @ModelAttribute("sourceDto") @Valid SourceDTO sourceDto, BindingResult result) {
        if (result.hasErrors()) {
            return "addSource";
        } else {
             Source source = new Source(sourceDto.getUrl(),sourceDto.getComment(),stepService.findStepById(id));
             sourceService.saveSource(source);
        }
        return "redirect:/step-{id}";
    }

    @RequestMapping(value = "/step-{id}/delete-source")
    public String deleteSource(@RequestParam(value = "sourceId") int sourceId, @PathVariable int id){
        sourceService.deleteSourceById(sourceId);
        return "redirect:/step-{id}";
    }
    }
