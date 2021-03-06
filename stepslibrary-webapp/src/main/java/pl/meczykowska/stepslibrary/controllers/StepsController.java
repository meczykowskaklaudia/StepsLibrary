package pl.meczykowska.stepslibrary.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.meczykowska.stepslibrary.domain.Step;
import pl.meczykowska.stepslibrary.dto.StepDTO;
import pl.meczykowska.stepslibrary.services.SourceService;
import pl.meczykowska.stepslibrary.services.StepService;

import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Controller
public class StepsController {

    @Autowired
    private StepService stepService;

    @Autowired
    private SourceService sourceService;

    @ModelAttribute("stepDto")
    public StepDTO createStepDTO() {
        return new StepDTO();
    }

    @RequestMapping(value = "/library", method = RequestMethod.GET)
    public String displaySteps(Model model) {
        model.addAttribute("steps", stepService.findAllSteps());
        return "library";
    }

    @RequestMapping(value = "/library", method = RequestMethod.POST)
    public String deleteStep(@RequestParam(value = "delete") int id) {
        stepService.deleteStepById(id);
        return "redirect:/library";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addStep() {
        return "addStep";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String sendStep(@ModelAttribute("stepDto") @Valid StepDTO stepDto, BindingResult result) {
        if (result.hasErrors()) {
            return "addStep";
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("MM-yyyy");
            try {
                Step step = new Step(stepDto.getName(), stepDto.getCreator(),
                        sdf.parse(stepDto.getCreationDate()), stepDto.getDifficultyLevel());
                stepService.addStep(step);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return "redirect:/library";
        }
    }

    @RequestMapping(value = "/step-{id}", method = RequestMethod.GET)
    public String showDetails(@PathVariable int id, Model model) {
        Step step = stepService.findStepById(id);
        model.addAttribute("step", step);
        model.addAttribute("sources", sourceService.findAllSourcesByStep(step));
        return "stepDetails";
    }
}
