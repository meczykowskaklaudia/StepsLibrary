package pl.meczykowska.stepslibrary.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import pl.meczykowska.stepslibrary.domain.Step;
import pl.meczykowska.stepslibrary.repositories.ISourceRepository;
import pl.meczykowska.stepslibrary.repositories.IStepRepository;

import java.util.List;

@Service
public class StepService {

    @Autowired
    IStepRepository stepRepository;

    @Autowired
    ISourceRepository sourceRepository;

    public void addStep(Step step) {
        stepRepository.save(step);
    }

    public Step findStepById(int index) {
        return stepRepository.findById(index);
    }

    public List<Step> findAllSteps() {
        return stepRepository.findAll();
    }

    @Secured("ROLE_ADMIN")
    public void deleteStepById(int index) {
        stepRepository.deleteById(index);
    }
}
