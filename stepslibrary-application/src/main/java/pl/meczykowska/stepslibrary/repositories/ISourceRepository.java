package pl.meczykowska.stepslibrary.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pl.meczykowska.stepslibrary.domain.Source;
import pl.meczykowska.stepslibrary.domain.Step;

import java.util.List;

@Repository
public interface ISourceRepository extends CrudRepository<Source, Integer> {
    Source save(Source source);
    void deleteById(int index);
    List<Source> findAllByStep(Step step);
}